import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class ToggleButtonGroup extends StatefulWidget {
  final List<String> buttonTitles;
  final void Function(int) onButtonSelected;

  const ToggleButtonGroup({
    super.key,
    required this.buttonTitles,
    required this.onButtonSelected,
  });

  @override
  _ToggleButtonGroupState createState() => _ToggleButtonGroupState();
}

class _ToggleButtonGroupState extends State<ToggleButtonGroup> {
  int _selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: Get.width * 0.85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          widget.buttonTitles.length,
          (index) => _buildButton(widget.buttonTitles[index], index),
        ),
      ),
    );
  }

  Widget _buildButton(String title, int index) {
    final isSelected = index == _selectedButtonIndex;
    return IconButton(
      onPressed: () {
        setState(() {
          _selectedButtonIndex = index;
        });
        widget.onButtonSelected(_selectedButtonIndex);
      },
      icon: Icon(
        index == 0
            ? CupertinoIcons.textformat
            : index == 1
                ? Icons.emoji_emotions_outlined
                : index == 2
                    ? Icons.brush_rounded
                    : Icons.border_style,
        color: isSelected ? AppColors.primary : AppColors.grey,
      ),
    );
  }
}
