import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sticker_maker/utils/colors.dart';
import 'package:sticker_maker/widgets/appbar.dart';

import '../Image Editing/screens/edit_image_screen.dart';
import '../widgets/custom_text.dart';
import 'making sticker/image_cutout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     UserImagePicker(
      //       onPickImage: (pickedImage) {
      //         _selectedImage = pickedImage;
      //       },
      //     ),
      //   ],
      // ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Imagepickerchoicedialog(context);
        },
        child: const Icon(
          CupertinoIcons.add,
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<dynamic> Imagepickerchoicedialog(context) async {
    // File? imagefile;
    return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        final ImagePicker picker = ImagePicker();
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: CupertinoButton.filled(
                    minSize: 60,
                    child: CustomText('Gallery'),
                    onPressed: () async {
                      XFile? photo =
                          await picker.pickImage(source: ImageSource.gallery);
                      // if (photo != null) {
                      //   imagefile = File(photo.path);
                      //   setState(() {});
                      // }
                      Get.to(EditImageScreen(selectedImage: photo!.path));
                      // Get.to(ImageCutOutPage(onPickImage: imagefile!));
                    },
                  ),
                ),
              ],
            ),
            Container(height: 1, color: Colors.black),
            Row(
              children: [
                Expanded(
                  child: CupertinoButton.filled(
                    minSize: 60,
                    child: CustomText('Camera'),
                    onPressed: () async {
                      XFile? photo =
                          await picker.pickImage(source: ImageSource.camera);
                      // if (photo != null) {
                      //   imagefile = File(photo.path);
                      //   setState(() {});
                      // }
                      Get.to(EditImageScreen(selectedImage: photo!.path));
                      // Get.to(ImageCutOutPage(onPickImage: imagefile!));
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
          ],
        );
      },
    );
  }
}
