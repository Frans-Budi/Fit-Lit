import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String iconAsset;

  const CustomListTile({
    super.key,
    this.onTap,
    required this.title,
    required this.iconAsset,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(
        iconAsset,
        width: AppSizes.s24,
        height: AppSizes.s24,
      ),
      contentPadding: EdgeInsets.only(left: AppSizes.s24),
      title: Text(
        title,
        style: TextStyles.listTileText(),
      ),
    );
  }
}
