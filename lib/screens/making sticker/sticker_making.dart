import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sticker_maker/utils/colors.dart';
import 'package:sticker_maker/widgets/Custom_Button.dart';
import 'package:sticker_maker/widgets/appbar.dart';
import 'package:sticker_maker/widgets/toggle_button.dart';

class EditPage extends StatefulWidget {
  // File onPickImage;

  const EditPage({
    super.key,
    // required this.onPickImage,
  });
// working on cutout page
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  int itemCount = 2000;
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
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                AlignedGridView.count(
                  crossAxisCount: 29,
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 10.h,
                      width: 10.w,
                      color: index % 2 == 1
                          ? AppColors.white
                          : AppColors.greyShade200,
                    );
                  },
                ),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Draggable(
                    feedback: Image.asset(
                      'assets/a.jpeg',
                    ),
                    child: Image.asset(
                      'assets/a.jpeg',
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.42,
            child: Column(
              children: [
                ToggleButtonGroup(
                  buttonTitles: buttonTitlesList,
                  onButtonSelected: (value) {
                    toggleButtonIndex = value;
                    setState(() {});
                  },
                ),
                Expanded(
                  child: Container(
                    color: AppColors.greyShade900,
                  ),
                ),
              ],
            ),
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

  var toggleValues = [false, false, true, false];
}


///56