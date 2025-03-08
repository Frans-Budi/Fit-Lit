import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/gen/assets.gen.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/utils/text_styles.dart';
import 'package:fit_lit/common/widgets/appbar/simple_app_bar.dart';
import 'package:fit_lit/common/widgets/image/circle_image.dart';
import 'package:fit_lit/feature/home/controllers/profile_controller.dart';
import 'package:fit_lit/feature/home/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  final ctr = Get.put(ProfileController());
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        onBack: ctr.onBackWithResult,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          AppSizes.s8.toVerticalSpace(),
          Center(
            child: Obx(
              () => CircleImage(
                imageUrl: ctr.account.value?.photo,
                width: AppSizes.s140,
                height: AppSizes.s140,
              ),
            ),
          ),
          AppSizes.s16.toVerticalSpace(),
          Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.s24),
              child: Column(
                children: [
                  Text(
                    ctr.account.value?.name ?? '',
                    style: TextStyles.heading(fontSize: FontSize.s32),
                  ),
                  Text(
                    '@${ctr.account.value?.username ?? ''}',
                    style: TextStyles.subHeading(fontSize: FontSize.s18),
                  ),
                ],
              ),
            ),
          ),
          AppSizes.s70.toVerticalSpace(),
          CustomListTile(
            onTap: ctr.doEditProfile,
            title: AppConstants.ACT_EDIT_PROFILE,
            iconAsset: Assets.icons.icEditProfile.path,
          ),
          CustomListTile(
            onTap: ctr.doAboutUs,
            title: AppConstants.ACT_ABOUT_US,
            iconAsset: Assets.icons.icAboutUs.path,
          ),
          CustomListTile(
            onTap: ctr.doLogout,
            title: AppConstants.ACT_LOGOUT,
            iconAsset: Assets.icons.icLogout.path,
          ),
        ],
      ),
    );
  }
}
