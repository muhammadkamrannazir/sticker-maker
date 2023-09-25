import 'dart:io';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sticker_maker/utils/colors.dart';
import '../../widgets/toggle_button.dart';
import '../widgets/edit_image_viewmodel.dart';
import '../widgets/image_text.dart';

class EditImageScreen extends StatefulWidget {
  final String selectedImage;
  const EditImageScreen({Key? key, required this.selectedImage})
      : super(key: key);

  @override
  _EditImageScreenState createState() => _EditImageScreenState();
}

class _EditImageScreenState extends EditImageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Screenshot(
                controller: screenshotController,
                child: SafeArea(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Stack(
                      children: [
                        _selectedImage,
                        for (int i = 0; i < texts.length; i++)
                          Positioned(
                            left: texts[i].left,
                            top: texts[i].top,
                            child: GestureDetector(
                              onLongPress: () {
                                setState(() {
                                  currentIndex = i;
                                  removeText(context);
                                });
                              },
                              onTap: () => setCurrentIndex(context, i),
                              child: Draggable(
                                feedback: ImageText(textInfo: texts[i]),
                                child: ImageText(textInfo: texts[i]),
                                onDragEnd: (drag) {
                                  final renderBox =
                                      context.findRenderObject() as RenderBox;
                                  Offset off =
                                      renderBox.globalToLocal(drag.offset);
                                  setState(() {
                                    texts[i].top = off.dy - 96;
                                    texts[i].left = off.dx;
                                  });
                                },
                              ),
                            ),
                          ),
                        creatorText.text.isNotEmpty
                            ? Positioned(
                                left: 0,
                                bottom: 0,
                                child: Text(
                                  creatorText.text,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(
                                        0.3,
                                      )),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: AppColors.grey.shade900,
            child: Row(
              children: [
                ToggleButtonGroup(
                  buttonIcons: const [
                    Icons.crop_square_outlined,
                    Icons.circle_outlined,
                    Icons.ads_click_rounded,
                    Icons.select_all_rounded,
                  ],
                  // buttonTexts: const [
                  //   'Square',
                  //   'Circle',
                  //   'Free Hand',
                  //   'Select All',
                  // ],
                  // buttonTitles: buttonTitlesList,
                  onButtonSelected: (value) {
                    toggleButtonIndex = value;
                    setState(() {});
                    print(toggleButtonIndex);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int toggleButtonIndex = 0;

  Widget get _selectedImage => Center(
        child: Image.file(
          File(
            widget.selectedImage,
          ),
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        ),
      );

  Widget get _addnewTextFab => FloatingActionButton(
        onPressed: () => addNewDialog(context),
        backgroundColor: Colors.white,
        tooltip: 'Add New Text',
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      );

  AppBar get _appBar => AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _addnewTextFab,
              IconButton(
                icon: const Icon(
                  Icons.save,
                  color: Colors.black,
                ),
                onPressed: () => saveToGallery(context),
                tooltip: 'Save Image',
              ),
              IconButton(
                icon: const Icon(
                  Icons.text_increase,
                  color: Colors.black,
                ),
                onPressed: increaseFontSize,
                tooltip: 'Increase font size',
              ),
              IconButton(
                icon: const Icon(
                  Icons.text_decrease,
                  color: Colors.black,
                ),
                onPressed: decreaseFontSize,
                tooltip: 'Decrease font size',
              ),
              IconButton(
                icon: const Icon(
                  Icons.format_align_left,
                  color: Colors.black,
                ),
                onPressed: alignLeft,
                tooltip: 'Align left',
              ),
              IconButton(
                icon: const Icon(
                  Icons.format_align_center,
                  color: Colors.black,
                ),
                onPressed: alignCenter,
                tooltip: 'Align Center',
              ),
              IconButton(
                icon: const Icon(
                  Icons.format_align_right,
                  color: Colors.black,
                ),
                onPressed: alignRight,
                tooltip: 'Align Right',
              ),
              IconButton(
                icon: const Icon(
                  Icons.format_bold,
                  color: Colors.black,
                ),
                onPressed: boldText,
                tooltip: 'Bold',
              ),
              IconButton(
                icon: const Icon(
                  Icons.format_italic,
                  color: Colors.black,
                ),
                onPressed: italicText,
                tooltip: 'Italic',
              ),
              IconButton(
                icon: const Icon(
                  Icons.space_bar,
                  color: Colors.black,
                ),
                onPressed: addLinesToText,
                tooltip: 'Add New Line',
              ),
              Tooltip(
                message: 'Red',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.red),
                    child: const CircleAvatar(
                      backgroundColor: Colors.red,
                    )),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'White',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.white),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                    )),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Black',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.black),
                    child: const CircleAvatar(
                      backgroundColor: Colors.black,
                    )),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Blue',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.blue),
                    child: const CircleAvatar(
                      backgroundColor: Colors.blue,
                    )),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Yellow',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.yellow),
                    child: const CircleAvatar(
                      backgroundColor: Colors.yellow,
                    )),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Green',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.green),
                    child: const CircleAvatar(
                      backgroundColor: Colors.green,
                    )),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Orange',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.orange),
                    child: const CircleAvatar(
                      backgroundColor: Colors.orange,
                    )),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Pink',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.pink),
                    child: const CircleAvatar(
                      backgroundColor: Colors.pink,
                    )),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      );
}
