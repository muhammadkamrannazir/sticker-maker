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
  final Color backgroundColor;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.title,
    this.child,
    this.leading,
    this.height = kToolbarHeight,
    this.showLanguageButton = false,
    this.automaticallyImplyLeading = false,
    this.centerTitle = false,
    this.backgroundColor = Colors.transparent,
    this.actions,
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
              title ?? '',
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              color: Colors.white,
              fontStyle: FontStyle.normal,
            ),
        actions: actions);
  }
}
