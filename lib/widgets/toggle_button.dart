import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class ToggleButtonGroup extends StatefulWidget {
  final List<IconData> buttonIcons;
  final List<String>? buttonTexts;
  final void Function(int) onButtonSelected;

  const ToggleButtonGroup({
    super.key,
    required this.buttonIcons,
    this.buttonTexts,
    required this.onButtonSelected,
  });

  @override
  _ToggleButtonGroupState createState() => _ToggleButtonGroupState();
}

class _ToggleButtonGroupState extends State<ToggleButtonGroup> {
  int _selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            widget.buttonIcons.length,
            (index) => _buildButton(
              widget.buttonIcons[index],
              widget.buttonTexts != null ? widget.buttonTexts![index] : null,
              index,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(IconData icon, String? text, int index) {
    final isSelected = index == _selectedButtonIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedButtonIndex = index;
        });
        widget.onButtonSelected(_selectedButtonIndex);
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.primary : AppColors.grey,
          ),
          if (text != null) SizedBox(height: 5.h),
          if (text != null)
            Text(
              text,
              style: TextStyle(
                color: isSelected ? AppColors.primary : AppColors.grey,
              ),
            ),
        ],
      ),
    );
  }
}
