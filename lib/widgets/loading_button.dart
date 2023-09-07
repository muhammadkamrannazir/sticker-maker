// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class CustomLoadingButton extends StatelessWidget {
  double? height;
  double? width;
  bool loading;
  Color? color;
  Color? textColor;
  Color? borderColor;
  CustomLoadingButton({
    Key? key,
    this.color,
    this.textColor,
    this.borderColor,
    this.height,
    this.loading = false,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //----------------> ?? means if height is null then assign assign 50.h else apply user entered height
      height: height ?? 57.h,
      width: width ?? MediaQuery.of(context).size.width * 0.7,
      child: Card(
        color: color ?? AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: BorderSide(
            color: borderColor ?? AppColors.red,
          ),
          // color: color ?? AppColors.green,
        ),
        child: const Center(
          child: CupertinoActivityIndicator(
            color: AppColors.red,
            radius: 15,
          ),
        ),
      ),
    );
  }
}
