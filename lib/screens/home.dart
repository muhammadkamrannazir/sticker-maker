import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sticker_maker/utils/colors.dart';
import 'package:sticker_maker/widgets/appbar.dart';

import '../Image Editing/screens/edit_image_screen.dart';
import '../widgets/custom_text.dart';

class HomePage extends StatefulWidget {
  Uint8List? image;
  HomePage({
    this.image,
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        backgroundColor: AppColors.grey.shade900,
        child: CustomText(
          'Sticker Maker',
          fontWeight: FontWeight.bold,
          fontSize: 30.sp,
          fontStyle: FontStyle.italic,
        ),
      ),
      backgroundColor: AppColors.grey.shade900,
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      'Personal Sticker',
                      fontSize: 14,
                    ),
                    CustomText(
                      'More',
                      color: Colors.grey.shade700,
                      fontSize: 12,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CustomText(
                  'Name of Sticker Pack',
                  color: Colors.grey.shade500,
                  fontSize: 12,
                ),
                const SizedBox(height: 5),
                const SizedBox(
                  height: 80,
                  // child: ListView.builder(
                  //   scrollDirection: Axis.horizontal,
                  //   itemCount: 3,
                  //   itemBuilder: (c, i) {
                  //     return Image.memory(
                  //       widget.image!,
                  //       height: 60,
                  //       width: 60,
                  //     );
                  //   },
                  // ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(const EditImageScreen()),
        child: const Icon(
          CupertinoIcons.add,
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  List stickersList = [];
}
