import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/helper/text_input_style_helper.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/utils/text_styles.dart';
import 'package:fit_lit/common/widgets/appbar/simple_app_bar.dart';
import 'package:fit_lit/feature/games/controllers/evaluation_controller.dart';
import 'package:fit_lit/feature/games/models/style_game_model.dart';
import 'package:fit_lit/feature/games/widgets/evaluation_loading.dart';
import 'package:fit_lit/feature/games/widgets/evaluation_question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EvaluationPage extends StatelessWidget {
  final ctr = Get.put(EvaluationController());
  final data = Get.arguments['style'] as StyleGameModel;

  EvaluationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        foregroundColor: data.foregroundColor,
      ),
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.s24),
          children: [
            AppSizes.s30.toVerticalSpace(),
            Text(
              AppConstants.TTL_EVALUATION,
              style: TextStyles.titlePage(color: data.foregroundColor),
            ),
            AppSizes.s24.toVerticalSpace(),
            Obx(() {
              if (ctr.isLoading.isTrue) {
                return const EvaluationLoading();
              }
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ctr.questions.length,
                separatorBuilder: (context, index) =>
                    AppSizes.s12.toVerticalSpace(),
                itemBuilder: (context, index) {
                  return EvaluationQuestion(
                    number: index + 1,
                    questionText: ctr.questions[index],
                    controller: ctr.listInputController[index],
                    borderColor: data.secondColor,
                    foregroundColor: data.foregroundColor,
                    style: TextInputStyleHelper.getTextInputStyle(
                      data.foregroundColor,
                    ),
                  );
                },
              );
            }),
            AppSizes.s20.toVerticalSpace(),
            Obx(
              () => ElevatedButton(
                onPressed:
                    ctr.isEnabledButton.isTrue ? ctr.doSaveEvaluation : null,
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  backgroundColor: data.foregroundColor,
                ),
                child: const Text(AppConstants.ACT_SAVE_EVALUATION),
              ),
            ),
            AppSizes.s20.toVerticalSpace(),
            AppSizes.paddingBottom.toVerticalSpace(),
          ],
        ),
      ),
    );
  }
}
