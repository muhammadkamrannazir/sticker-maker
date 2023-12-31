// import 'package:flutter/material.dart';
// import 'package:stick_it/stick_it.dart';

// class SimplestExample extends StatelessWidget {
//   const SimplestExample({Key? key}) : super(key: key);
//   static String routeName = 'simplest-example';
//   static String routeTitle = 'Simplest Example';
//   final String _background =
//       'https://images.unsplash.com/photo-1545147986-a9d6f2ab03b5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(routeTitle),
//       ),
//       body: StickIt(
//         stickerList: [
//           Image.network(
//               'https://www.hiclipart.com/free-transparent-background-png-clipart-ithdr'),
//           Image.network(
//               'https://www.iconfinder.com/icons/334108/badge_sticker_discount_free_label_icon'),
//           Image.network(
//               'https://th.bing.com/th/id/R.900c0cd630da3fc108ab9d847bde7584?rik=uJ00lFGY%2fNU7GA&pid=ImgRaw&r=0'),
//         ],

//         /// The [StickIt] Class only requires two named parameters.
//         ///
//         /// [Widget] child - the child that the stickers should be placed upon.
//         /// [List<Image>] stickerList - the list of stickers available to the user.
//         ///
//         /// StickIt supports a lot of styling related optional named parameters,
//         /// that you can change and check out in the AdvancedExample. (tbd)
//         child: Image.network(_background),
//       ),
//     );
//   }
// }
