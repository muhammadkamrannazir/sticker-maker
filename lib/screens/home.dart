import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sticker_maker/screens/image_picker/image_select.dart';
import 'package:sticker_maker/utils/colors.dart';
import 'package:sticker_maker/widgets/appbar.dart';

import '../widgets/custom_text.dart';
import '../widgets/image_picker_choice.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        child: CustomText(
          'Sticker Maker',
          fontWeight: FontWeight.bold,
          fontSize: 30.sp,
          fontStyle: FontStyle.italic,
        ),
      ),
      backgroundColor: AppColors.black,
      // appBar: const CustomAppBar(
      //   backgroundColor: AppColors.black,
      // ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // UserImagePicker(
          //   onPickImage: (pickedImage) {
          //     _selectedImage = pickedImage;
          //   },
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const PickImagePage());
        },
        child: const Icon(
          CupertinoIcons.add,
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  File? _selectedImage;
}
