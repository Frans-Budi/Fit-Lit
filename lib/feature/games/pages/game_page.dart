import 'package:fit_lit/common/gen/assets.gen.dart';
import 'package:fit_lit/common/services/my_storage.dart';
import 'package:fit_lit/common/utils/app_colors.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/widgets/image/custom_network_image.dart';
import 'package:fit_lit/feature/games/controllers/game_controller.dart';
import 'package:fit_lit/feature/games/widgets/broken_image_widget.dart';
import 'package:fit_lit/feature/games/widgets/custom_sliver_app_bar.dart';
import 'package:fit_lit/feature/games/widgets/custom_sliver_games.dart';
import 'package:fit_lit/feature/games/widgets/custom_sliver_loading.dart';
import 'package:fit_lit/feature/games/widgets/game_app_bar_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GamePage extends StatelessWidget {
  final ctr = Get.put(GameController());
  GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Obx(
            () => CustomSliverAppBar(
              title: ctr.gameCategory.value?.title ?? '',
              subTitle: ctr.gameCategory.value?.subTitle ?? '',
              backgroundColor: ctr.gameCategory.value?.backgroundColor ??
                  Colors.grey.shade300,
              foregroundColor: ctr.gameCategory.value?.foregroundColor ??
                  AppColors.petrolBlueLight,
              image: FutureBuilder(
                future: MyStorage.getImageUrl(
                    ctr.gameCategory.value?.imageName ?? '',
                    subFolder: ctr.gameCategory.value?.subFolder ?? ''),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return GameAppBarLoading(
                      color: ctr.gameCategory.value?.foregroundColor,
                    );
                  }
                  if (snapshot.hasData) {
                    return Align(
                      alignment: Alignment.bottomRight,
                      child: UnconstrainedBox(
                        child: CustomNetworkImage(
                          height: AppSizes.s230,
                          width: AppSizes.s200,
                          imageUrl: snapshot.data ?? '',
                          loadingColor: ctr.gameCategory.value?.foregroundColor,
                        ),
                      ),
                    );
                  }
                  return Assets.images.noImage.image(
                    width: AppSizes.s80,
                    height: AppSizes.s80,
                  );
                },
              ),
            ),
          ),
          Obx(
            () {
              if (ctr.isLoading.isTrue) {
                return const CustomSliverLoading();
              }
              return CustomSliverGames(
                onTap: (game) => ctr.goToDetail(game),
                games: ctr.games,
                imageBuilder: (index) {
                  return FutureBuilder(
                    future: MyStorage.getImageUrl(ctr.games[index].imageName,
                        subFolder: ctr.games[index].subFolder),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasData) {
                        return CustomNetworkImage(
                          width: double.infinity,
                          height: double.infinity,
                          imageUrl: snapshot.data ?? '',
                        );
                      }
                      return const BrokenImageWidget();
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
