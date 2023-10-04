import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:sticker_view/stickerview.dart';

class StickerViewClass extends StatefulWidget {
  const StickerViewClass({Key? key}) : super(key: key);

  @override
  State<StickerViewClass> createState() => _StickerViewClassState();
}

class _StickerViewClassState extends State<StickerViewClass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save_alt),
          onPressed: () async {
            Uint8List? imageData =
                await StickerView.saveAsUint8List(ImageQuality.high);
            if (imageData != null) {
              var imageName = DateTime.now().microsecondsSinceEpoch.toString();
              var appDocDir = await getApplicationDocumentsDirectory();
              String imagePath = '${appDocDir.path}$imageName.png';
              File imageFile = File(imagePath);
              imageFile.writeAsBytesSync(imageData);
              // ignore: avoid_print
              print("imageFile::::$imageFile");
            }
          },
        ),
        body: Center(
          child: StickerView(
            height: 670,
            stickerList: [
              Sticker(
                id: "uniqueId_111",
                child: Image.network(
                    "https://images.unsplash.com/photo-1640113292801-785c4c678e1e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=736&q=80"),
              ),
              Sticker(
                id: "uniqueId_222",
                isText: true,
                child: const Text("Hello"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
