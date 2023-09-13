import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sticker_maker/screens/making%20sticker/image_cutout.dart';
import 'package:sticker_maker/widgets/appbar.dart';

class PickImagePage extends StatefulWidget {
  const PickImagePage({super.key});

  @override
  State<PickImagePage> createState() => _PickImagePageState();
}

class _PickImagePageState extends State<PickImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:  CustomAppBar(
        title: 'SELECT A PHOTO',
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: AlignedGridView.count(
          itemCount: 26,
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            return index == 0 || index == 1
                ? Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () async {
                          XFile? photo;
                          photo = await picker.pickImage(
                            source: index == 0
                                ? ImageSource.camera
                                : ImageSource.gallery,
                          );
                          if (photo != null) {
                            imagefile = File(photo.path);
                            Get.to(ImageCutOutPage(onPickImage: imagefile!));
                            setState(() {});
                            print(imagefile);
                          }
                        },
                        icon: Icon(
                          index == 0
                              ? CupertinoIcons.camera_fill
                              : CupertinoIcons.photo,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: 100.h,
                    width: 100.w,
                    color: Colors.grey.shade800,
                  );
          },
        ),
      ),
    );
  }

  final ImagePicker picker = ImagePicker();

  File? imagefile;
}
