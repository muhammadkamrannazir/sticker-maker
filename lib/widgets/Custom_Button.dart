// ignore_for_file: must_be_immutable, file_names

// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String name;
  double? height;
  double? width;
  bool loading;
  Color? color;
  Color? textColor;
  Color? borderColor;
  VoidCallback? onPressed;
  CustomButton({
    Key? key,
    required this.name,
    this.color,
    this.textColor,
    this.borderColor,
    this.height,
    this.loading = false,
    this.width,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: height ?? 62.h,
        width: width ?? double.infinity,
        child: Card(
          color: color ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: CustomText(
              name,
              fontSize: 14.sp,
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonSecondary extends StatelessWidget {
  final String name;
  double? height;
  double? width;
  bool loading;
  Color? color;
  Color? textColor;
  Color? borderColor;
  VoidCallback? onPressed;
  CustomButtonSecondary({
    Key? key,
    required this.name,
    this.color,
    this.textColor,
    this.borderColor,
    this.height,
    this.loading = false,
    this.width,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: height ?? 62.h,
        width: width ?? double.infinity,
        child: Card(
          color: color ?? AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: AppColors.secondary),
          ),
          child: Center(
            child: CustomText(
              name,
              fontSize: 14.sp,
              color: textColor ?? AppColors.secondary,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final String name;
  IconData icon;
  double? height;
  double? width;
  bool loading;
  Color? color;
  Color? textColor;
  Color? borderColor;
  Color? iconColor;
  VoidCallback? onPressed;
  CustomIconButton({
    Key? key,
    required this.name,
    required this.icon,
    required this.onPressed,
    this.color,
    this.textColor,
    this.height,
    this.loading = false,
    this.borderColor,
    this.iconColor,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: SizedBox(
        height: 52, // Adjust the height as needed
        width: width ?? MediaQuery.of(context).size.width * 0.7,
        child: Card(
          color: color ?? AppColors.red,
          margin: EdgeInsets.zero,
          elevation: 4, // Add elevation to create a shadow effect
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
            // side: BorderSide(
            //   color: borderColor ?? AppColors.red,
            // )
          ),
          child: TextButton.icon(
            // onPressed: () {
            //   snackbar(
            //     'کتاب اپلوڈ ہوگئی',
            //   );
            // },
            onPressed: onPressed,
            icon: isLoading == true
                ? indicator()
                : CustomText(
                    name,
                    // 'کتاب اپلوڈ کریں',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: textColor ?? Colors.white,
                  ),
            label: isLoading == true
                ? const SizedBox()
                : Icon(
                    icon,
                    color: iconColor ?? Colors.white,
                    size: 30,
                  ),
          ),
        ),
      ),
    );
  }
}

indicator() {
  return const Center(
    child: CupertinoActivityIndicator(
      color: AppColors.white,
      radius: 15,
    ),
  );
}

class GoogleAuthButton extends StatelessWidget {
  final String name;
  IconData icon;
  double? height;
  double? width;
  bool loading;
  Color? color;
  Color? textColor;
  Color? borderColor;
  Color? iconColor;
  VoidCallback? onPressed;
  GoogleAuthButton({
    Key? key,
    required this.name,
    required this.icon,
    required this.onPressed,
    this.color,
    this.textColor,
    this.height,
    this.loading = false,
    this.borderColor,
    this.iconColor,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // bool isLoading = false;
    return TextButton.icon(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(color: Color.fromARGB(255, 2, 1, 1)),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor ?? AppColors.red),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      onPressed: () => {},
      icon: const Icon(
        Icons.g_mobiledata_outlined,
        color: AppColors.red,
        size: 30,
      ),
      label: CustomText(
        name,
        color: AppColors.red,
        fontSize: 18.sp,
      ),
    );
  }
}

class CustomDetailButton extends StatelessWidget {
  final String name;
  double? height;
  double? width;
  bool loading;
  Color? color;
  Color? textColor;
  Color? borderColor;
  VoidCallback? onPressed;
  CustomDetailButton({
    Key? key,
    required this.name,
    this.color,
    this.textColor,
    this.borderColor,
    this.height,
    this.loading = false,
    this.width,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: height ?? 62.h,
        width: width ?? double.infinity,
        child: Card(
          color: color ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  'Total amount =',
                  fontSize: 12.sp,
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.w400,
                ),
                CustomText(
                  name,
                  color: textColor ?? AppColors.primary,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
