import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        widget.buttonTitles.length,
        (index) => _buildButton(widget.buttonTitles[index], index),
      ),
    );
  }

  Widget _buildButton(String title, int index) {
    final isSelected = index == _selectedButtonIndex;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedButtonIndex = index;
          });
          widget.onButtonSelected(_selectedButtonIndex);
        },
        child: CircleAvatar(
          radius: 40.r,
          backgroundColor: AppColors.primary,
          child: CircleAvatar(
            radius: 38.r,
            backgroundColor: isSelected ? AppColors.secondary : Colors.white,
            child: Text(
              "$title RO",
              style: TextStyle(
                color: isSelected ? Colors.black : AppColors.primary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
