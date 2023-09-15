import 'dart:io';

import 'package:crop_image/crop_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomStickerEditor extends StatefulWidget {

  const CustomStickerEditor({super.key});

  @override
  State<CustomStickerEditor> createState() => _CustomStickerEditorState();
}

class _CustomStickerEditorState extends State<CustomStickerEditor> {
  double _left = 0.0;
  double _top = 0.0;
  XFile? file;
  bool iscrop=false;
  final controller = CropController(

    aspectRatio: 1,
    defaultCrop: Rect.fromLTRB(0.1, 0.1, 0.9, 0.9),
  );
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(child: Container(
            padding: EdgeInsets.all(5),
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Text",style: TextStyle(color: Colors.white),)),),
              SizedBox(width: 5,),
              InkWell(
                onTap: () async {
                  file=await ImagePicker().pickImage(source: ImageSource.gallery);
                  setState(() {

                  });
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text("Image",style: TextStyle(color: Colors.white),)),),
              SizedBox(width: 5,),
              InkWell(
                onTap: () async {
                  iscrop=!iscrop;
                  setState(() {

                  });
                },
                child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Text("Crop",style: TextStyle(color: Colors.white),)),)

            ],

          ),
          SizedBox(
            height: MediaQuery.of(context).size.height-70,
            child: Stack(
              children: [
                if(file!=null)
             Positioned.fill(
               child: iscrop?cropwidget():Image.file(File(file!.path)),

             ),
                Positioned(
                  left: _left,
                  top: _top,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      setState(() {
                        _left += details.delta.dx;
                        _top += details.delta.dy;
                      });
                    },
                    child: Container(
                      color: Colors.blue,
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Drag me!',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  cropwidget(){
    return CropImage(

      controller: controller,
      image: Image.file(File(file!.path)),
      alwaysMove: true,

);
}
}