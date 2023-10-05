// import 'package:flutter/material.dart';
// import 'package:lindi_sticker_widget/lindi_controller.dart';
// import 'package:lindi_sticker_widget/lindi_sticker_widget.dart';



// class LindiStickerClassFeature extends StatefulWidget {
//   const LindiStickerClassFeature({super.key});

//   @override
//   State<LindiStickerClassFeature> createState() => _LindiStickerClassFeatureState();
// }

// class _LindiStickerClassFeatureState extends State<LindiStickerClassFeature> {

//   late LindiController controller;

//   List<Widget> widgets = [
//     SizedBox(
//         height: 100,
//         width: 100,
//         child: Image.network('https://picsum.photos/200/200')
//     ),
//     const Icon(Icons.favorite, color: Colors.red, size: 50)
//   ];

//   @override
//   void initState() {
//     controller = LindiController(
//       borderColor: Colors.white,
//       iconColor: Colors.black
//     );
//     for (var element in widgets) {
//       controller.addWidget(element);
//     }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text('Lindi Sticker Widget'),
//       ),
//       body: LindiStickerWidget(
//         controller: controller,
//         child: SizedBox(
//           width: double.infinity,
//           height: double.infinity,
//           child: Image.network('https://picsum.photos/200/300', fit: BoxFit.cover)
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {

//           controller.addWidget(
//             Container(
//               padding: const EdgeInsets.all(5),
//               decoration: const BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.all(Radius.circular(20))
//               ),
//               child: const Text(
//                 'This is a Text',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           );

//         },
//         tooltip: 'Add',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }