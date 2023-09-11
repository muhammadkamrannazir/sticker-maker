import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sticker_maker/utils/colors.dart';
import 'package:sticker_maker/widgets/Custom_Button.dart';
import 'package:sticker_maker/widgets/appbar.dart';

class ImageCutOutPage extends StatefulWidget {
  File onPickImage;

  ImageCutOutPage({
    super.key,
    required this.onPickImage,
  });
// working on cutout page
  @override
  State<ImageCutOutPage> createState() => _ImageCutOutPageState();
}

class _ImageCutOutPageState extends State<ImageCutOutPage> {
  bool isCircle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(
        backgroundColor: Colors.black,
        title: 'IMAGE CUT OUT',
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Center(
                  child: isCircle == true
                      ? Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 2, color: Colors.white),
                            image: DecorationImage(
                              image: FileImage(widget.onPickImage),
                            ),
                          ),
                        )
                      : CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 122,
                          child: CircleAvatar(
                            radius: 120,
                            backgroundImage: FileImage(widget.onPickImage),
                          ),
                        ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircularIconButton(
                    icon: Icons.crop_free_sharp,
                    onPressed: () {},
                  ),
                  CircularIconButton(
                    icon: Icons.rotate_right,
                    onPressed: () {},
                  ),
                  CircularIconButton(
                    icon: Icons.rotate_left,
                    onPressed: () {},
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
              Container(
                height: 100.h,
                color: AppColors.grey.shade900,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomIconButton(
                        name: 'Square',
                        icon: Icons.crop_square_outlined,
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: CustomIconButton(
                        name: 'Circle',
                        icon: Icons.circle_outlined,
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: CustomIconButton(
                        name: 'Free Hand',
                        icon: Icons.ads_click_rounded,
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: CustomIconButton(
                        name: 'Select All',
                        icon: Icons.select_all_rounded,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
