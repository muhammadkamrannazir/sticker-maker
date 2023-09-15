import 'dart:io';

import 'package:crop_image/crop_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sticker_maker/screens/making%20sticker/sticker_making.dart';
import 'package:sticker_maker/utils/colors.dart';
import 'package:sticker_maker/widgets/Custom_Button.dart';
import 'package:sticker_maker/widgets/appbar.dart';
import 'package:sticker_maker/widgets/toggle_button.dart';

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
  final controller = CropController(
    aspectRatio: 1,
    defaultCrop: const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9),
  );
  double _scale = 1.0;
  double _previousScale = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        backgroundColor: Colors.black,
        title: 'IMAGE CUT OUT',
        automaticallyImplyLeading: true,
        actions: [
          CustomButton(
            name: 'NEXT',
            onPressed: () async {
              final image = await controller.croppedImage();
              Get.to(EditPage(
                image: image,
              ));
            },
          ),
          SizedBox(width: 12.w),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: toggleButtonIndex == 0
                  ? CropImage(
                      controller: controller,
                      image: Image.file(widget.onPickImage),
                      alwaysMove: true,
                    )
                  : GestureDetector(
                      onScaleStart: (details) {
                        _previousScale = _scale;
                      },
                      onScaleUpdate: (details) {
                        setState(() {
                          _scale = _previousScale * details.scale;
                        });
                      },
                      child: Transform.scale(
                        scale: _scale,
                        child: Image.file(
                          widget.onPickImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircularIconButton(
                    icon: Icons.center_focus_strong_rounded,
                    onPressed: () {
                      controller.rotation = CropRotation.up;
                      controller.crop = const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9);
                      controller.aspectRatio = 1.0;
                    },
                  ),
                  CircularIconButton(
                    icon: Icons.rotate_left,
                    onPressed: _rotateLeft,
                  ),
                  CircularIconButton(
                    icon: Icons.rotate_right,
                    onPressed: _rotateRight,
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
              //////1/
              Container(
                color: AppColors.grey.shade900,
                child: Row(
                  children: [
                    ToggleButtonGroup(
                      buttonIcons: const [
                        Icons.crop_square_outlined,
                        Icons.circle_outlined,
                        Icons.ads_click_rounded,
                        Icons.select_all_rounded,
                      ],
                      buttonTexts: const [
                        'Square',
                        'Circle',
                        'Free Hand',
                        'Select All',
                      ],
                      // buttonTitles: buttonTitlesList,
                      onButtonSelected: (value) {
                        toggleButtonIndex = value;
                        setState(() {});
                        print(toggleButtonIndex);
                      },
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

  int toggleButtonIndex = 0;
  List<String> buttonTitlesList = [
    '1',
    '5',
    '20',
    '50',
  ];
  Future<void> _aspectRatios() async {
    final value = await showDialog<double>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Select aspect ratio'),
          children: [
            // special case: no aspect ratio
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, -1.0),
              child: const Text('free'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 1.0),
              child: const Text('square'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 2.0),
              child: const Text('2:1'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 1 / 2),
              child: const Text('1:2'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 4.0 / 3.0),
              child: const Text('4:3'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 16.0 / 9.0),
              child: const Text('16:9'),
            ),
          ],
        );
      },
    );
    if (value != null) {
      controller.aspectRatio = value == -1 ? null : value;
      controller.crop = const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9);
    }
  }

  Future<void> _rotateLeft() async => controller.rotateLeft();
  Future<void> _rotateRight() async => controller.rotateRight();
}
