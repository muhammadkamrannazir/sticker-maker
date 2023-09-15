import 'package:flutter/material.dart';

class CircularCrop extends StatelessWidget {
  const CircularCrop({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          const Center(
            child: ClipOval(
              child: CircleAvatar(
                radius: 100,
                // backgroundColor: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
