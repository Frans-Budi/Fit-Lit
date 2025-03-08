import 'package:carousel_slider/carousel_slider.dart';
import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/gen/assets.gen.dart';
import 'package:fit_lit/common/services/my_storage.dart';
import 'package:fit_lit/common/utils/app_colors.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/utils/text_styles.dart';
import 'package:fit_lit/common/widgets/appbar/simple_app_bar.dart';
import 'package:fit_lit/common/widgets/image/custom_network_image.dart';
import 'package:fit_lit/feature/games/controllers/playing_game_controller.dart';
import 'package:fit_lit/feature/games/models/style_game_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PlayingGamePage extends StatelessWidget {
  final ctr = Get.put(PlayingGameController());
  final data = Get.arguments['style'] as StyleGameModel;
  final Map<String, String> _imageCache = {};
  PlayingGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        foregroundColor: data.foregroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Obx(() {
              return CarouselSlider.builder(
                itemCount: ctr.games.length,
                options: CarouselOptions(
                  aspectRatio: 1 / 1,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  enlargeFactor: 0.5,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) => ctr.doPageChange(index),
                ),
                carouselController: ctr.carouselController,
                itemBuilder: (context, index, realIndex) {
                  if (ctr.games.isEmpty) return const SizedBox();
                  final gameData = ctr.games[index];

                  return buildImage(
                    imageName: gameData.imageName,
                    subFolder: gameData.subFolder,
                  );
                },
              );
            }),
          ),
          AppSizes.s20.toVerticalSpace(),
          Obx(
            () {
              if (ctr.games.isEmpty) return const SizedBox();
              final index = ctr.currentIndex.value;
              return Text(
                ctr.games[index].title,
                textAlign: TextAlign.center,
                style: TextStyles.titleCard(),
              );
            },
          ),
          AppSizes.s12.toVerticalSpace(),
          Obx(
            () {
              if (ctr.games.isEmpty) return const SizedBox();
              final index = ctr.currentIndex.value;
              return SizedBox(
                height: AppSizes.s60,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.s32),
                  child: Text(
                    ctr.games[index].subTitle,
                    textAlign: TextAlign.center,
                    style: TextStyles.subTitleCard(fontWeight: FontWeight.w500),
                  ),
                ),
              );
            },
          ),
          AppSizes.s20.toVerticalSpace(),
          Obx(
            () => AnimatedSmoothIndicator(
              activeIndex: ctr.currentIndex.value,
              count: ctr.games.length,
              effect: WormEffect(
                dotWidth: AppSizes.s10,
                dotHeight: AppSizes.s10,
                dotColor: AppColors.greyLight,
                activeDotColor: data.foregroundColor,
                spacing: AppSizes.s8,
              ),
            ),
          ),
          AppSizes.s70.toVerticalSpace(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.s32),
            child: Row(
              children: [
                Expanded(
                  child: Obx(
                    () => ctr.currentIndex.value == 0
                        ? const SizedBox()
                        : ElevatedButton(
                            onPressed: ctr.doPreviousButton,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: data.secondColor,
                              textStyle: TextStyle(
                                fontSize: FontSize.s12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: const Text(AppConstants.ACT_PREVIOUS),
                          ),
                  ),
                ),
                AppSizes.s32.toHorizontalSpace(),
                Expanded(
                  child: ElevatedButton(
                    onPressed: ctr.doNextButton,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: data.foregroundColor,
                      textStyle: TextStyle(
                        fontSize: FontSize.s12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Obx(() => Text(ctr.nextText.value)),
                  ),
                ),
              ],
            ),
          ),
          AppSizes.s60.toVerticalSpace(),
        ],
      ),
    );
  }

  Widget buildImage({required String imageName, required String subFolder}) {
    if (_imageCache.containsKey(imageName)) {
      return CustomNetworkImage(
        imageUrl: _imageCache[imageName]!,
        width: double.infinity,
      );
    }

    return FutureBuilder(
      future: MyStorage.getImageUrl(imageName, subFolder: subFolder),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          _imageCache[imageName] = snapshot.data!;
          return CustomNetworkImage(
            imageUrl: snapshot.data!,
            width: double.infinity,
          );
        }
        return Assets.images.noImage.image(
          width: AppSizes.s100,
          height: AppSizes.s100,
        );
      },
    );
  }
}
