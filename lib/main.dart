import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sticker_maker/Image%20Editing/features/stack_board.dart';
import 'package:sticker_maker/screens/home.dart';

import 'Image Editing/features/animated_emoj.dart';
import 'Image Editing/features/emoj.dart';
import 'Image Editing/features/image_sticker.dart';
import 'Image Editing/features/stick_it.dart';
import 'Image Editing/features/stickereditor.dart';
import 'Image Editing/features/whatsapp_sticker_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sticker Maker',
        home: StickerEditorClassFeature(),
      ),
    );
  }
}
