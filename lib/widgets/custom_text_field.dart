import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hintText;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String?)? onSaved;
  final Widget? icon;
  final bool? obscureText;
  final bool? visibility;
  final bool? dataFieldStyle;
  final bool readOnly;
  final Function? onShowPassword;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  String? Function(String?)? validator;
  int? maxLines;
  int? minLines;

  CustomTextFormField({
    Key? key,
    this.hintText,
    this.errorText,
    this.readOnly = false,
    this.keyboardType,
    this.textInputAction,
    this.onSaved,
    this.controller,
    this.icon,
    this.obscureText = false,
    this.visibility = false,
    this.dataFieldStyle = true,
    this.onShowPassword,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.maxLines,
    this.minLines,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      controller: widget.controller,
      style: TextStyle(fontSize: 18.sp),
      decoration: InputDecoration(
        hintText: widget.hintText,
        alignLabelWithHint: true,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.sp,
        ),
        border: border(),
        focusedBorder: border(),
        enabledBorder: border(),
        suffixIcon: widget.suffixIcon,
        prefixIcon: Icon(
          widget.prefixIcon,
          color: Colors.blueGrey,
        ),
        filled: true,
        fillColor: AppColors.white,
      ),
      textInputAction: widget.textInputAction ?? TextInputAction.next,
    );
  }

  void dissmissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    );
  }
}

class CustomTextFormFieldSecondary extends StatefulWidget {
  final String? labelText;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String?)? onSaved;
  final Widget? icon;
  final bool? obscureText;
  final bool? visibility;
  final bool? dataFieldStyle;
  final bool readOnly;
  final Function? onShowPassword;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  String? Function(String?)? validator;
  int? maxLines;
  int? minLines;

  CustomTextFormFieldSecondary({
    Key? key,
    this.labelText,
    this.errorText,
    this.readOnly = false,
    this.keyboardType,
    this.textInputAction,
    this.onSaved,
    this.controller,
    this.icon,
    this.obscureText = false,
    this.visibility = false,
    this.dataFieldStyle = true,
    this.onShowPassword,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.maxLines,
    this.minLines,
  }) : super(key: key);

  @override
  State<CustomTextFormFieldSecondary> createState() =>
      _CustomTextFormFieldSecondary();
}

class _CustomTextFormFieldSecondary
    extends State<CustomTextFormFieldSecondary> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: TextFormField(
        validator: widget.validator,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        controller: widget.controller,
        style: TextStyle(fontSize: 18.sp),
        decoration: InputDecoration(
          labelText: widget.labelText,
          alignLabelWithHint: true,
          labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16.sp,
          ),
          border: border(),
          focusedBorder: border(),
          enabledBorder: border(),
          suffixIcon: widget.suffixIcon,
          // prefixIcon: Icon(
          //   widget.prefixIcon,
          //   color: Colors.blueGrey,
          // ),
          filled: true,
          fillColor: AppColors.white,
          contentPadding: EdgeInsets.only(left: 15.w),
        ),
        textInputAction: widget.textInputAction ?? TextInputAction.next,
      ),
    );
  }

  void dissmissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.primary),
    );
  }
}
