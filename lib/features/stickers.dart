import 'package:flutter/material.dart';

class StickerClass extends StatelessWidget {
  final onTap;

  StickerClass({
   this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // int stickerNumber = 0;
    return SizedBox(
      height: 230,
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            61,
            (index) => GestureDetector(
              onTap: () {
                if (onTap != null) onTap!('assets/stickers/$index.png');
              },
              child: Image.asset(
                'assets/stickers/$index.png',
                width: 80,
                height: 80,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
