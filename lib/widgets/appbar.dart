import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? child;
  final Widget? leading;
  final double height;
  final bool automaticallyImplyLeading;
  final bool showLanguageButton;
  final bool centerTitle;
  final Color? backgroundColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.child,
    this.leading,
    this.height = kToolbarHeight,
    this.showLanguageButton = false,
    this.automaticallyImplyLeading = false,
    this.centerTitle = false,
    this.backgroundColor,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: leading,
      title: child ??
          CustomText(
            title ?? 'Sticker Maker',
            fontWeight: FontWeight.bold,
            fontSize: 30.sp,
            fontStyle: FontStyle.italic,
          ),
      actions: [
        showLanguageButton == true
            ? Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: CircleAvatar(
                  radius: 13,
                  backgroundColor: AppColors.primary,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: CustomText(
                      'ع',
                      color: AppColors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
