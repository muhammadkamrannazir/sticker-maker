import 'package:crop_image/crop_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sticker_maker/utils/colors.dart';
import 'package:sticker_maker/widgets/Custom_Button.dart';
import 'package:sticker_maker/widgets/appbar.dart';
import 'package:undo/undo.dart';

class EditPage extends StatefulWidget {
  Image image;
  EditPage({
    super.key,
    required this.image,
  });
// working on cutout page
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  int itemCount = 2000;
  final controller = CropController(
    aspectRatio: 1,
    defaultCrop: const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9),
  );
  double _left = 0.0;
  double _top = 0.0;
  var changes = ChangeStack();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: CustomAppBar(
        backgroundColor: AppColors.black,
        title: 'EDIT',
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.arrowshape_turn_up_left_fill,
              color: AppColors.grey,
              size: 20,
            ),
          ),
          SizedBox(width: 15.w),
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.arrowshape_turn_up_right_fill,
              color: AppColors.grey,
              size: 20,
            ),
          ),
          SizedBox(width: 15.w),
          CustomButton(
            name: 'CREATE',
            onPressed: () {
              // Get.to();
            },
          ),
          SizedBox(width: 12.w),
        ],
      ),
      body: Column(
        children: [
          Container(color: Colors.white, child: const TextField()),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // AlignedGridView.count(
                //   crossAxisCount: 29,
                //   itemCount: itemCount,
                //   itemBuilder: (context, index) {
                //     return Container(
                //       height: 10.h,
                //       width: 10.w,
                //       color: index % 2 == 1
                //           ? AppColors.white
                //           : AppColors.greyShade200,
                //     );
                //   },
                // ),
                InteractiveViewer(
                  minScale: 0.2,
                  maxScale: 10,
                  child: Positioned(
                    left: _left,
                    top: _top,
                    child: GestureDetector(
                      onPanUpdate: (details) {
                        setState(() {
                          _left += details.delta.dx;
                          _top += details.delta.dy;
                        });
                      },
                      child: widget.image,
                    ),
                  ),
                ),
                // Image(image: ImageProvider()),
                // CropImage(
                //   controller: controller,
                //   image: Image.file(File(widget.image.path)),
                //   alwaysMove: false,
                // ),
              ],
            ),
          ),
          // SizedBox(
          //   height: Get.height * 0.42,
          //   child: Column(
          //     children: [
          //       // ToggleButtonGroup(
          //       //   buttonTitles: buttonTitlesList,
          //       //   onButtonSelected: (value) {
          //       //     toggleButtonIndex = value;
          //       //     setState(() {});
          //       //   },
          //       // ),
          //       Expanded(
          //         child: Container(
          //           color: AppColors.greyShade900,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
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

  var toggleValues = [false, false, true, false];
  
}
