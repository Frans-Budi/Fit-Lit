import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/routes/app_routes.dart';
import 'package:fit_lit/common/services/my_storage.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/utils/app_method.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/widgets/appbar/simple_app_bar.dart';
import 'package:fit_lit/common/widgets/image/custom_network_image.dart';
import 'package:fit_lit/common/widgets/image/custom_no_image.dart';
import 'package:fit_lit/feature/games/controllers/detail_game_controller.dart';
import 'package:fit_lit/feature/games/models/game_detail_model.dart';
import 'package:fit_lit/feature/games/models/game_part_model.dart';
import 'package:fit_lit/feature/games/models/style_game_model.dart';
import 'package:fit_lit/feature/games/widgets/custom_linear_percent.dart';
import 'package:fit_lit/feature/games/widgets/detail_game_card.dart';
import 'package:fit_lit/feature/games/widgets/detail_game_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailGamePage extends StatelessWidget {
  final ctr = Get.put(DetailGameController());
  final Map<String, String> _imageCache = {};

  DetailGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'container-${ctr.gameId}',
      child: Obx(() {
        GameDetailModel? data = ctr.gameDetail.value;
        if (data == null) {
          return const SizedBox();
        }
        return Scaffold(
          appBar: SimpleAppBar(
            backgroundColor: data.backgroundColor,
            foregroundColor: data.foregroundColor,
          ),
          backgroundColor: data.backgroundColor,
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              AppSizes.s26.toVerticalSpace(),
              Obx(
                () => CustomLinearPercent(
                  percent: ctr.percentage.value,
                  progressColor: data.foregroundColor,
                ),
              ),
              AppSizes.s4.toVerticalSpace(),
              DetailGameTitle(data: data, textColor: data.foregroundColor),
              AppSizes.s50.toVerticalSpace(),
              SizedBox(
                height: AppSizes.s430,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.s24),
                  itemCount: data.gameParts.length,
                  separatorBuilder: (context, index) =>
                      AppSizes.s24.toHorizontalSpace(),
                  itemBuilder: (context, index) {
                    GamePartModel? gamePart = data.gameParts[index];
                    return DetailGameCard(
                      onPlay: () => AppMethod.showConfirmPlayGameModal(
                        context,
                        onNotSafe: () => Get.back(),
                        onSafe: () {
                          Get.back();
                          Get.toNamed(
                            Routes.playingGame,
                            arguments: {
                              "style": StyleGameModel.fromJson({
                                "id": gamePart.id,
                                "foreground_color": data.foregroundColor,
                                "second_color": data.secondColor,
                                "safe_icon_color": data.safeIconColor,
                              }),
                              "isFinish": gamePart.isFinish,
                            },
                          );
                        },
                        safeIconColor: data.safeIconColor,
                        secondColor: data.secondColor,
                        foregroundColor: data.foregroundColor,
                      ),
                      onInfo: () {
                        Get.toNamed(Routes.pdfView, arguments: {
                          "title": AppConstants.TTL_ACTIVITY_INFORMATION,
                          "pdf_name": gamePart.pdfName,
                        });
                      },
                      isLoading: ctr.isLoading.value,
                      isFinish: gamePart.isFinish,
                      foregroundColor: data.foregroundColor,
                      secondColor: data.secondColor,
                      gamePart: gamePart,
                      image: buildImage(gamePart),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildImage(GamePartModel? gamePart) {
    if (gamePart == null) return const CustomNoImage();

    // Check if the image is already cached
    if (_imageCache.containsKey(gamePart.imageName)) {
      return CustomNetworkImage(
        imageUrl: _imageCache[gamePart.imageName]!,
        width: double.infinity,
        height: double.infinity,
      );
    }
    return FutureBuilder(
      future: MyStorage.getImageUrl(gamePart.imageName,
          subFolder: gamePart.subFolder),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          _imageCache[gamePart.imageName] = snapshot.data!;
          return CustomNetworkImage(
            imageUrl: snapshot.data!,
            width: double.infinity,
            height: double.infinity,
          );
        }
        return const CustomNoImage();
      },
    );
  }
}
