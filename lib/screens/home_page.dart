import 'package:flutter/material.dart';
import 'package:sticker_maker/widgets/appbar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar()
    );
  }
}
