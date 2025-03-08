import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/routes/app_routes.dart';
import 'package:fit_lit/common/services/my_storage.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/widgets/image/custom_network_image.dart';
import 'package:fit_lit/feature/home/controllers/home_controller.dart';
import 'package:fit_lit/feature/home/widgets/home_card.dart';
import 'package:fit_lit/feature/home/widgets/home_heading.dart';
import 'package:fit_lit/feature/home/widgets/home_heading_loading.dart';
import 'package:fit_lit/feature/home/widgets/home_leading_guest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final ctr = Get.put(HomeController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Obx(
            () {
              final data = ctr.account.value;
              if (ctr.isLoading.isTrue) {
                return const HomeHeadingLoading();
              } else if (data == null) {
                return const HomeLeadingGuest();
              }
              return HomeHeading(
                onTap: ctr.goToProfile,
                name: data.name,
                photoUrl: data.photo,
              );
            },
          ),
          AppSizes.s8.toVerticalSpace(),
          Obx(
            () => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ctr.games.length,
              itemBuilder: (context, index) {
                return HomeCard(
                  onTap: () => Get.toNamed(Routes.game,
                      arguments: ctr.games[index].categoryId),
                  title: ctr.games[index].title,
                  subTitle: ctr.games[index].subTitle,
                  backgroundColor: ctr.games[index].backgroundColor,
                  foregroundColor: ctr.games[index].foregroundColor,
                  image: Positioned(
                    left: ctr.games[index].sizePosition.left,
                    top: ctr.games[index].sizePosition.top,
                    child: FutureBuilder(
                        future: MyStorage.getImageUrl(
                            ctr.games[index].imageName,
                            subFolder: ctr.games[index].subFolder),
                        builder: (context, snapshot) {
                          return CustomNetworkImage(
                            width: ctr.games[index].sizePosition.width,
                            height: ctr.games[index].sizePosition.height,
                            imageUrl: snapshot.data ?? '',
                          );
                        }),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
