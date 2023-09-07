import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class CustomDropdownButton extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final void Function(String?)? onChanged;
  String? Function(String?)? validator;
  void Function(String?)? onSaved;
  CustomDropdownButton({
    super.key,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
      child: DropdownButtonFormField<String>(
        /// This value should come from list or should be conmmented else will give error. TThere should be exatly one item ..... blah blah
        // value: selectedItem,
        menuMaxHeight: Get.height * 0.5,
        validator: validator,
        onSaved: onSaved,
        focusColor: Colors.white,
        decoration: InputDecoration(
          fillColor: AppColors.white,
          filled: true,
          focusedBorder: border(),
          enabledBorder: border(),
          border: border(),
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 15.h,
            horizontal: 12.w,
          ),
        ),
        onChanged: onChanged,
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w500,
        ),
        selectedItemBuilder: (BuildContext context) {
          return items.map<Widget>((String item) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: Text(
                  item,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            );
          }).toList();
        },
        items: items
            .where((item) => item != 'select')
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    );
  }
}
