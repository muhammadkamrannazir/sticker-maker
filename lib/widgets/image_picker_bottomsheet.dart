// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:image_picker/image_picker.dart';

// /* ==============================> This File Contains Picking Image from both gallery and camera in two blue bottomsheet buttons   <==========
// =================================> +  <======
// =================================> Code of Simple Grid View using Staggered GridView Builder    <=========

//  👇👇👇Don't Forget to use this button like this👇👇👇

//           UserImagePicker(
//             onPickImage: (pickedImage) {
//               _selectedImage = pickedImage;
//             },
//           ),
// */

// class ImagePickerFromBottomSheet extends StatefulWidget {
//   const ImagePickerFromBottomSheet({super.key});

//   @override
//   State<ImagePickerFromBottomSheet> createState() => _ImagePickerFromBottomSheetState();
// }

// class _ImagePickerFromBottomSheetState extends State<ImagePickerFromBottomSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: AlignedGridView.count(
//         itemCount: 10,
//         crossAxisCount: 4,
//         mainAxisSpacing: 4,
//         crossAxisSpacing: 4,
//         itemBuilder: (context, index) {
//           return index == 0
//               ? Container(
//                   height: 100.h,
//                   width: 100.w,
//                   color: Colors.blue,
//                   child: Center(
//                     child: IconButton(
//                         onPressed: () {
//                           Imagepickerchoicedialog(context);
//                         },
//                         icon: const Icon(Icons.add)),
//                   ),
//                 )
//               : Container(
//                   height: 100.h,
//                   width: 100.w,
//                   color: Colors.red,
//                 );
//         },
//       ),
//     );
//   }

//   Future<dynamic> Imagepickerchoicedialog(context) async {
//     return showCupertinoModalPopup(
//       context: context,
//       builder: (context) {
//         final ImagePicker picker = ImagePicker();
//         return Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             const SizedBox(height: 2),
//             CupertinoActionSheet(
//               // message: Column(
//               //   children: [
//               //     Row(
//               //       children: [
//               //         Expanded(
//               //           child: CupertinoButton.filled(
//               //             minSize: 60,
//               //             child: CustomText('Gallery'),
//               //             onPressed: () async {
//               //               XFile? photo;
//               //               photo = await picker.pickImage(
//               //                   source: ImageSource.gallery);
//               //               if (photo != null) {
//               //                 imagefile = File(photo.path);
//               //                 setState(() {});
//               //               }
//               //               Navigator.pop(context);
//               //             },
//               //           ),
//               //         ),
//               //       ],
//               //     ),
//               //     Container(height: 1, color: Colors.black),
//               //     Row(
//               //       children: [
//               //         Expanded(
//               //           child: CupertinoButton.filled(
//               //             minSize: 60,
//               //             child: CustomText('Camera'),
//               //             onPressed: () async {
//               //               XFile? photo;

//               //               photo = await picker.pickImage(
//               //                   source: ImageSource.camera);

//               //               if (photo != null) {
//               //                 imagefile = File(photo.path);
//               //                 setState(() {});
//               //               }
//               //               Navigator.pop(context);
//               //             },
//               //           ),
//               //         ),
//               //       ],
//               //     ),
//               //   ],
//               // ),

//               actions: [
//                 CupertinoActionSheetAction(
//                   onPressed: () {},
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(CupertinoIcons.photo),
//                       SizedBox(width: 10),
//                       Text(
//                         "Gallery",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                       SizedBox(width: 8),
//                     ],
//                   ),
//                 ),
//                 CupertinoActionSheetAction(
//                   onPressed: () {},
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(CupertinoIcons.camera),
//                       SizedBox(width: 10),
//                       Text(
//                         "Camera",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ],
//                   ),
//                 ),
//                 CupertinoActionSheetAction(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: const Text(
//                     "Cancel",
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 ),
//               ],
//               // cancelButton: CupertinoActionSheetAction(
//               //   child: const Text("Cancel"),
//               //   onPressed: () {
//               //     // Navigator.of(context).pop();
//               //   },
//               // ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   var imagefile;
// }
