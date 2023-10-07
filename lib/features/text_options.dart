// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:stack_board/stack_board.dart';

// class TextOptionsClassFeature extends StatefulWidget {
//   const TextOptionsClassFeature({super.key});

//   @override
//   State<TextOptionsClassFeature> createState() => _TextOptionsClassFeatureState();
// }

// class _TextOptionsClassFeatureState extends State<TextOptionsClassFeature> {
//   late StackBoardController _boardController;

//   @override
//   void initState() {
//     super.initState();
//     _boardController = StackBoardController();
//   }

// //
//   @override
//   void dispose() {
//     _boardController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           FloatingActionButton.small(
//             backgroundColor: Colors.white,
//             onPressed: () {
//               _boardController.add(
//                 const AdaptiveText(
//                   'New Text',
//                   tapToEdit: true,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               );
//             },
//             child: const Icon(
//               Icons.text_fields_rounded,
//               color: Colors.black,
//             ),
//           ),
//           FloatingActionButton.small(
//             // onPressed: () => _boardController.add(addNewDialog(context)),
//             onPressed: () {
//               _boardController.add(
//                 const AdaptiveText(
//                   'New Text',
//                   tapToEdit: true,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               );
//             },
//             backgroundColor: Colors.white,
//             tooltip: 'Add New Text',
//             child: const Icon(
//               Icons.add,
//               color: Colors.black,
//             ),
//           ),
//           IconButton(
//             icon: const Icon(
//               Icons.text_increase,
//               color: Colors.white,
//             ),
//             onPressed: increaseFontSize,
//             tooltip: 'Increase font size',
//           ),
//           IconButton(
//             icon: const Icon(
//               Icons.text_decrease,
//               color: Colors.white,
//             ),
//             onPressed: decreaseFontSize,
//             tooltip: 'Decrease font size',
//           ),
//           GestureDetector(
//             onTap: () {
//               Get.bottomSheet(
//                 colorBottomSheet(),
//                 isScrollControlled: true,
//                 persistent: false,
//                 enableDrag: false,
//               );
//             },
//             child: const Icon(
//               Icons.color_lens_rounded,
//               color: Colors.white,
//             ),
//           ),
//           IconButton(
//             icon: const Icon(
//               Icons.format_align_left,
//               color: Colors.white,
//             ),
//             onPressed: alignLeft,
//             tooltip: 'Align left',
//           ),
//           IconButton(
//             icon: const Icon(
//               Icons.format_align_center,
//               color: Colors.white,
//             ),
//             onPressed: alignCenter,
//             tooltip: 'Align Center',
//           ),
//           IconButton(
//             icon: const Icon(
//               Icons.format_align_right,
//               color: Colors.white,
//             ),
//             onPressed: alignRight,
//             tooltip: 'Align Right',
//           ),
//           IconButton(
//             icon: const Icon(
//               Icons.format_bold,
//               color: Colors.white,
//             ),
//             onPressed: boldText,
//             tooltip: 'Bold',
//           ),
//           IconButton(
//             icon: const Icon(
//               Icons.format_italic,
//               color: Colors.white,
//             ),
//             onPressed: italicText,
//             tooltip: 'Italic',
//           ),
//           IconButton(
//             icon: const Icon(
//               Icons.space_bar,
//               color: Colors.white,
//             ),
//             onPressed: addLinesToText,
//             tooltip: 'Add New Line',
//           ),
//         ],
//       ),
//     );
//   }
// }