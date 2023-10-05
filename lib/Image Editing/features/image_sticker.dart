import 'package:flutter/material.dart';
import 'package:image_stickers/image_stickers.dart';
import 'package:image_stickers/image_stickers_controls_style.dart';

class ImageStickerClassFeature extends StatefulWidget {
  const ImageStickerClassFeature({Key? key}) : super(key: key);

  @override
  State<ImageStickerClassFeature> createState() =>
      _ImageStickerClassFeatureState();
}

class _ImageStickerClassFeatureState extends State<ImageStickerClassFeature> {
  List<UISticker> stickers = [];

  @override
  void initState() {
    stickers.add(createSticker(0));
  }

  UISticker createSticker(int index) {
    return UISticker(
        imageProvider: const AssetImage("assets/a.jpeg"),
        x: 100 + 100.0 * index,
        y: 360,
        editable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        stickers.add(createSticker(stickers.length));
                      });
                    },
                    child: const Text("Add sticker")),
              ],
            ),
            Expanded(
                flex: 7,
                child: ImageStickers(
                  backgroundImage: const AssetImage("assets/a.jpeg"),
                  stickerList: stickers,
                  stickerControlsStyle: ImageStickersControlsStyle(
                      color: Colors.blueGrey,
                      child: const Icon(
                        Icons.zoom_out_map,
                        color: Colors.white,
                      )),
                )),
            Expanded(flex: 3, child: Container())
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
