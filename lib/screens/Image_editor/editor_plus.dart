import 'dart:io';
import 'package:crop_image/crop_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class tempcrop extends StatefulWidget {
  const tempcrop({Key? key}) : super(key: key);

  @override
  State<tempcrop> createState() => _tempcropState();
}

class _tempcropState extends State<tempcrop> {
  final controller = CropController(
    aspectRatio: 1,
    defaultCrop: const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9),
  );
  XFile? file;
  cropwidget() {
    return CropImage(
      controller: controller,
      image: Image.file(File(file!.path)),
      alwaysMove: false,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            InkWell(
              onTap: () async {
                file =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                setState(() {});
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(color: Colors.blue),
                child: const Text(
                  "Image",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            if (file != null) cropwidget()
          ],
        ),
        bottomNavigationBar: _buildButtons(),
      );

  Widget _buildButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.center_focus_strong_rounded),
            // icon:  Icon(Icons.radio_button_unchecked_outlined),
            onPressed: () {
              controller.rotation = CropRotation.up;
              controller.crop = const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9);
              controller.aspectRatio = 1.0;
            },
          ),
          IconButton(
            icon: const Icon(Icons.aspect_ratio),
            onPressed: _aspectRatios,
          ),
          IconButton(
            icon: const Icon(Icons.rotate_90_degrees_ccw_outlined),
            onPressed: _rotateLeft,
          ),
          IconButton(
            icon: const Icon(Icons.rotate_90_degrees_cw_outlined),
            onPressed: _rotateRight,
          ),
          TextButton(
            onPressed: _finished,
            child: const Text('Done'),
          ),
        ],
      );

  Future<void> _aspectRatios() async {
    final value = await showDialog<double>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Select aspect ratio'),
          children: [
            // special case: no aspect ratio
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, -1.0),
              child: const Text('free'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 1.0),
              child: const Text('square'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 2.0),
              child: const Text('2:1'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 1 / 2),
              child: const Text('1:2'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 4.0 / 3.0),
              child: const Text('4:3'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 16.0 / 9.0),
              child: const Text('16:9'),
            ),
          ],
        );
      },
    );
    if (value != null) {
      controller.aspectRatio = value == -1 ? null : value;
      controller.crop = const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9);
    }
  }

  Future<void> _rotateLeft() async => controller.rotateLeft();
  Future<void> _rotateRight() async => controller.rotateRight();

  Future<void> _finished() async {
    final image = await controller.croppedImage();
    // ignore: use_build_context_synchronously
    await showDialog<bool>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(6.0),
          titlePadding: const EdgeInsets.all(8.0),
          title: const Text('Cropped image'),
          children: [
            Text('relative: ${controller.crop}'),
            Text('pixels: ${controller.cropSize}'),
            const SizedBox(height: 5),
            image,
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

}
