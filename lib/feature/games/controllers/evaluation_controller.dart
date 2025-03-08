import 'package:fit_lit/common/di/application_module.dart';
import 'package:fit_lit/common/helper/show_loading_dialog.dart';
import 'package:fit_lit/common/services/remote_config/remote_config_repository.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/widgets/dialog/success_dialog.dart';
import 'package:fit_lit/feature/auth/services/auth_repository.dart';
import 'package:fit_lit/feature/games/models/evaluation_model.dart';
import 'package:fit_lit/feature/games/models/style_game_model.dart';
import 'package:fit_lit/feature/games/services/evaluation_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EvaluationController extends GetxController {
  final RemoteConfigRepository _configRepository = locator();
  final AuthRepository _authRepository = locator();
  final EvaluationRepository _evaluationRepository = locator();
  final data = Get.arguments['style'] as StyleGameModel;
  final isFinish = Get.arguments['isFinish'] as bool;

  final isEnabledButton = RxBool(false);
  final isLoading = RxBool(false);

  final List<TextEditingController> listInputController = [];
  final List<bool> validateInputList = [];

  final questions = RxList<String>();

  @override
  void onInit() async {
    super.onInit();
    await initializeData();
    initListenValidateController();
  }

  void doSaveEvaluation() async {
    showLoadingDialog(context: Get.context!, message: 'Menyimpan . . .');

    final evaluation = EvaluationModel(
      userId: _authRepository.currentUser!.uid,
      gameId: data.id,
      listQnA: List.generate(
        questions.length,
        (index) => QnA(
            question: questions[index],
            answer: listInputController[index].text),
      ),
    );

    final result = await _evaluationRepository.saveEvaluation(evaluation);
    Get.back(); // clear loading
    if (result) {
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) {
          return SuccessDialog(
            text: AppConstants.LBL_EVALUATION_SAVED,
            textColor: data.foregroundColor,
            iconColor: data.safeIconColor,
          );
        },
      );
      await Future.delayed(const Duration(milliseconds: 2500));
      Get.back(); // clear dialog
      Get.back(); // back to game
      Get.back(); // back to part
      Get.back(result: data.id); // back to category
    }
  }

  Future<void> initializeData() async {
    if (isFinish) {
      await loadEvaluation();
    } else {
      final fetchedQuestions =
          _configRepository.fetchEvaluationQuestionById(data.id);

      // Ensure the fetched data is not null or empty
      if (fetchedQuestions.isNotEmpty) {
        questions.assignAll(fetchedQuestions);
      }

      initializeControllers(questions.length);
    }
  }

  void initializeControllers(int count) {
    listInputController.clear();
    for (int i = 0; i < count; i++) {
      listInputController.add(TextEditingController());
    }
  }

  void initListenValidateController() {
    for (var controller in listInputController) {
      controller.addListener(() => _validateForm(controller));
    }
  }

  void _validateForm(TextEditingController controller) {
    isEnabledButton.value = listInputController.every((c) => c.text.isNotEmpty);
  }

  Future<void> loadEvaluation() async {
    String? uid = _authRepository.currentUser?.uid;
    if (uid == null) return;

    isLoading.value = true;
    final result = await _evaluationRepository.getEvaluation("$uid|${data.id}");
    result.fold(
      (failure) {},
      (evaluation) {
        if (evaluation == null) {
          isLoading.value = false;
          return;
        }
        for (var qna in evaluation.listQnA) {
          questions.add(qna.question);
          listInputController.add(TextEditingController(text: qna.answer));
        }
      },
    );
    isLoading.value = false;
  }

  @override
  void onClose() {
    super.onClose();
    for (var controller in listInputController) {
      controller.dispose();
    }
  }
}
