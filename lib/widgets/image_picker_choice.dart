import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sticker_maker/widgets/custom_text.dart';

/* ==============================> This File Contains Picking Image from both gallery and camera in two blue bottomsheet buttons   <==========
=================================> +  <======
=================================> Waheed commented code of picking images, which is commented at last of this file.    <=========

 👇👇👇Don't Forget to use this button like this👇👇👇

          UserImagePicker(
            onPickImage: (pickedImage) {
              _selectedImage = pickedImage;
            },
          ),
*/


class UserImagePicker extends StatefulWidget {
  final void Function(File pickedImage) onPickImage;

  const UserImagePicker({
    super.key,
    required this.onPickImage,
  });

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImageFile;
  @override
  Widget build(BuildContext context) {
    void pickImage() async {
      final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxWidth: 150,
      );

      setState(() {
        _pickedImageFile = File(pickedImage!.path);
      });

      widget.onPickImage(_pickedImageFile!);
    }

    return Column(
      children: [
        CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey,
            backgroundImage:
                _pickedImageFile != null ? FileImage(_pickedImageFile!) : null),
        TextButton.icon(
          onPressed: () {
            Imagepickerchoicedialog(context);
          },
          icon: const Icon(Icons.image),
          label: Text(
            'Pick Image',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> Imagepickerchoicedialog(context) async {
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
                      XFile? photo;

                      photo =
                          await picker.pickImage(source: ImageSource.gallery);

                      if (photo != null) {
                        imagefile = File(photo.path);
                        setState(() {});
                      }
                      Navigator.pop(context);
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
                      XFile? photo;

                      photo =
                          await picker.pickImage(source: ImageSource.camera);

                      if (photo != null) {
                        imagefile = File(photo.path);
                        setState(() {});
                      }
                      Navigator.pop(context);
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

  var imagefile;
  // Future<dynamic> Imagepickerchoicedialog(context) async {
  //   final ImagePicker picker = ImagePicker();
  //   return showGeneralDialog(
  //     barrierLabel: "Label",
  //     barrierDismissible: true,
  //     barrierColor: Colors.black.withOpacity(0.5),
  //     transitionDuration: const Duration(milliseconds: 700),
  //     context: context,
  //     pageBuilder: (context, anim1, anim2) {
  //       return StatefulBuilder(builder: (context, setState) {
  //         return Align(
  //           alignment: Alignment.bottomCenter,
  //           child: Container(
  //             height: 120,
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 SizedBox(
  //                     width: 60,
  //                     height: 60,
  //                     child: GestureDetector(
  //                         onTap: () async {
  //                           XFile? photo;
  //                           photo = await picker.pickImage(
  //                               source: ImageSource.gallery);
  //                           if (photo != null) {
  //                             imagefile = File(photo.path);
  //                             setState(() {});
  //                           }
  //                           Navigator.pop(context);
  //                         },
  //                         child: Image.asset(
  //                           "assets/gallery.png",
  //                         ))),
  //                 SizedBox(
  //                     width: 60,
  //                     height: 55,
  //                     child: GestureDetector(
  //                         onTap: () async {
  //                           XFile? photo;
  //                           photo = await picker.pickImage(
  //                               source: ImageSource.camera);
  //                           if (photo != null) {
  //                             imagefile = File(photo.path);
  //                             setState(() {});
  //                           }
  //                           Navigator.pop(context);
  //                         },
  //                         child: Image.asset(
  //                           "assets/camera.png",
  //                         ))),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  //     },
  //     transitionBuilder: (context, anim1, anim2, child) {
  //       return SlideTransition(
  //         position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
  //             .animate(anim1),
  //         child: child,
  //       );
  //     },
  //   );
  // }
}
