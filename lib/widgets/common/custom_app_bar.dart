import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';
import 'package:study_app/widgets/app_circle_button.dart';
import 'package:study_app/widgets/common/background_decoration.dart';

import '../../configs/themes/app_icons.dart';
import '../../configs/themes/custom_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  final Widget? titleWidget;

  final Widget? leading;

  final bool showActionIcon;

  final VoidCallback? onMenuActionTap;

  const CustomAppBar({
    Key? key,
    this.title = '',
    this.showActionIcon = false,
    this.leading,
    this.titleWidget,
    this.onMenuActionTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: mobileScreenPadding, vertical: mobileScreenPadding),
        child: Stack(
          children: [
            Positioned.fill(
              child: titleWidget == null
                  ? Center(
                      child: Text(
                        title,
                        style: appBarTS,
                      ),
                    )
                  : Center(
                      child: titleWidget,
                    ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  leading ??
                      Transform.translate(
                        offset: const Offset(-14, 0),
                        child: const BackButton(),
                      ),
                  if (showActionIcon)
                    Transform.translate(
                      offset: const Offset(5, 0),
                      child: InkWell(
                          onTap: onMenuActionTap ??
                              () => Get.toNamed('/testoverview'),
                          child: const Icon(AppIcons.menu)),
                    )
                ])
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 80);
}
