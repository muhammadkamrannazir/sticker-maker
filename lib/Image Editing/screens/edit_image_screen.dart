import 'dart:io';
import 'package:crop_image/crop_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:stack_board/stack_board.dart';
import 'package:sticker_maker/widgets/custom_text.dart';
import '../../utils/colors.dart';
import '../../widgets/Custom_Button.dart';
import '../../widgets/toggle_button.dart';
import '../widgets/edit_image_viewmodel.dart';
import '../widgets/image_text.dart';

class EditImageScreen extends StatefulWidget {
  final File selectedImage;
  const EditImageScreen({Key? key, required this.selectedImage})
      : super(key: key);

  @override
  _EditImageScreenState createState() => _EditImageScreenState();
}

class _EditImageScreenState extends EditImageViewModel {
  late StackBoardController _boardController;

  @override
  void initState() {
    super.initState();
    _boardController = StackBoardController();
  }

//
  @override
  void dispose() {
    _boardController.dispose();
    super.dispose();
  }

  final controller = CropController(
    aspectRatio: 1,
    defaultCrop: const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: _appBar,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: Screenshot(
                    controller: screenshotController,
                    child: SafeArea(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
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
                                      final renderBox = context
                                          .findRenderObject() as RenderBox;
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

                            // creatorText.text.isNotEmpty
                            //     ? Positioned(
                            //         left: 0,
                            //         bottom: 0,
                            //         child: Text(
                            //           creatorText.text,
                            //           style: TextStyle(
                            //               fontSize: 20,
                            //               fontWeight: FontWeight.bold,
                            //               color: Colors.black.withOpacity(
                            //                 0.3,
                            //               )),
                            //         ),
                            //       )
                            //     : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                StackBoard(
                  controller: _boardController,
                  caseStyle: const CaseStyle(
                    borderColor: Colors.grey,
                    iconColor: Colors.white,
                  ),
                  background: const ColoredBox(color: Colors.transparent),
                  customBuilder: (StackBoardItem t) {
                    // if (t is CustomItem) {
                    return ItemCase(
                      key: Key('StackBoardItem${t.id}'),
                      isCenter: true,
                      onDel: () async => _boardController.remove(t.id),
                      onTap: () => _boardController.moveItemToTop(t.id),
                      caseStyle: const CaseStyle(
                        borderColor: Colors.grey,
                        iconColor: Colors.white,
                      ),
                      child: Container(
                        width: 100,
                        height: 100,
                        // color: t.color,
                        alignment: Alignment.center,
                        child: const Text(
                          'Custom item',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                    // }
                    // return null;
                  },
                ),
              ],
            ),
          ),
          const Divider(color: Colors.white),
          toggleButtonIndex == 0 ? imageOptions() : const SizedBox(),
          toggleButtonIndex == 1 ? textOptions() : const SizedBox(),
          toggleButtonIndex == 2 ? addNewOptions() : const SizedBox(),
          Divider(color: AppColors.primary),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              children: [
                ToggleButtonGroup(
                  buttonIcons: const [
                    Icons.crop,
                    CupertinoIcons.textformat,
                    Icons.ads_click_rounded,
                    Icons.select_all_rounded,
                  ],
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
        child: CropImage(
          controller: controller,
          image: Image.file(
            widget.selectedImage,
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width,
          ),
          alwaysMove: true,
        ),
      );

  Widget get _addnewTextFab => FloatingActionButton.small(
        onPressed: () => addNewDialog(context),
        backgroundColor: Colors.white,
        tooltip: 'Add New Text',
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      );

  AppBar get _appBar => AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              Get.dialog(
                CupertinoAlertDialog(
                  content: CustomText(
                    'Are you want to save the edited image?',
                    color: Colors.black,
                  ),
                  actions: [
                    Container(
                      color: Colors.grey,
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: CustomText(
                          'No',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      child: TextButton(
                        onPressed: saveToGallery(context),
                        child: CustomText(
                          'Yes',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            tooltip: 'Save Image',
          ),
        ],
      );

  Widget colorBottomSheet() {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 40.w),
              CustomText(
                'Choose Color',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          Container(
            color: AppColors.primary,
            width: double.infinity,
            height: 1,
          ),
          SizedBox(height: 15.h),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              Tooltip(
                message: 'White',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.white),
                    child: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: 19.5,
                        backgroundColor: Colors.white,
                      ),
                    )),
              ),
              Tooltip(
                message: 'Black',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.black),
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                  ),
                ),
              ),
              Tooltip(
                message: 'blue',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.blue),
                  child: const CircleAvatar(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
              Tooltip(
                message: 'brown',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.brown),
                  child: const CircleAvatar(
                    backgroundColor: Colors.brown,
                  ),
                ),
              ),
              Tooltip(
                message: 'cyan',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.cyan),
                  child: const CircleAvatar(
                    backgroundColor: Colors.cyan,
                  ),
                ),
              ),
              Tooltip(
                message: 'green',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.green),
                  child: const CircleAvatar(
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
              Tooltip(
                message: 'grey',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.grey),
                    child: const CircleAvatar(
                      backgroundColor: Colors.grey,
                    )),
              ),
              Tooltip(
                message: 'indigo',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.indigo),
                    child: const CircleAvatar(
                      backgroundColor: Colors.indigo,
                    )),
              ),
              Tooltip(
                message: 'lime',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.lime),
                    child: const CircleAvatar(
                      backgroundColor: Colors.lime,
                    )),
              ),
              Tooltip(
                message: 'orange',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.orange),
                  child: const CircleAvatar(
                    backgroundColor: Colors.orange,
                  ),
                ),
              ),
              Tooltip(
                message: 'pink',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.pink),
                    child: const CircleAvatar(
                      backgroundColor: Colors.pink,
                    )),
              ),
              Tooltip(
                message: 'red',
                child: GestureDetector(
                    onTap: () => changeTextColor(Colors.red),
                    child: const CircleAvatar(
                      backgroundColor: Colors.red,
                    )),
              ),
              Tooltip(
                message: 'teal',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.teal),
                  child: const CircleAvatar(
                    backgroundColor: Colors.teal,
                  ),
                ),
              ),
              Tooltip(
                message: 'yellow',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.yellow),
                  child: const CircleAvatar(
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget textOptions() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _addnewTextFab,
          IconButton(
            icon: const Icon(
              Icons.text_increase,
              color: Colors.white,
            ),
            onPressed: increaseFontSize,
            tooltip: 'Increase font size',
          ),
          IconButton(
            icon: const Icon(
              Icons.text_decrease,
              color: Colors.white,
            ),
            onPressed: decreaseFontSize,
            tooltip: 'Decrease font size',
          ),
          GestureDetector(
            onTap: () {
              Get.bottomSheet(
                colorBottomSheet(),
                isScrollControlled: true,
                persistent: false,
                enableDrag: false,
              );
            },
            child: const Icon(
              Icons.color_lens_rounded,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.format_align_left,
              color: Colors.white,
            ),
            onPressed: alignLeft,
            tooltip: 'Align left',
          ),
          IconButton(
            icon: const Icon(
              Icons.format_align_center,
              color: Colors.white,
            ),
            onPressed: alignCenter,
            tooltip: 'Align Center',
          ),
          IconButton(
            icon: const Icon(
              Icons.format_align_right,
              color: Colors.white,
            ),
            onPressed: alignRight,
            tooltip: 'Align Right',
          ),
          IconButton(
            icon: const Icon(
              Icons.format_bold,
              color: Colors.white,
            ),
            onPressed: boldText,
            tooltip: 'Bold',
          ),
          IconButton(
            icon: const Icon(
              Icons.format_italic,
              color: Colors.white,
            ),
            onPressed: italicText,
            tooltip: 'Italic',
          ),
          IconButton(
            icon: const Icon(
              Icons.space_bar,
              color: Colors.white,
            ),
            onPressed: addLinesToText,
            tooltip: 'Add New Line',
          ),
        ],
      ),
    );
  }

  Widget addNewOptions() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              _boardController.add(
                const AdaptiveText(
                  'New Text',
                  tapToEdit: true,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              );
            },
            child: const Icon(Icons.border_color),
          ),
          FloatingActionButton(
            onPressed: () {
              _boardController.add(
                StackBoardItem(
                  child: Image.network(
                    'https://avatars.githubusercontent.com/u/47586449?s=200&v=4',
                  ),
                  onDel: () async {
                    return true;
                  },
                ),
              );
            },
            child: const Icon(Icons.image),
          ),
          FloatingActionButton(
            onPressed: () {
              _boardController.add(
                const StackDrawing(
                  caseStyle: CaseStyle(
                    borderColor: Colors.grey,
                    iconColor: Colors.white,
                    boxAspectRatio: 1,
                  ),
                ),
              );
            },
            child: const Icon(Icons.color_lens),
          ),
        ],
      ),
    );
  }

  Widget imageOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircularIconButton(
          icon: Icons.aspect_ratio,
          onPressed: _aspectRatios,
        ),
        CircularIconButton(
          icon: Icons.center_focus_strong_rounded,
          onPressed: () {
            controller.rotation = CropRotation.up;
            controller.crop = const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9);
            controller.aspectRatio = 1.0;
          },
        ),
        CircularIconButton(
          icon: Icons.rotate_left,
          onPressed: _rotateLeft,
        ),
        CircularIconButton(
          icon: Icons.rotate_right,
          onPressed: _rotateRight,
        ),
        const Spacer(),
        CircleAvatar(
          backgroundColor: AppColors.primary,
          child: IconButton(
            onPressed: () async {
              await controller.croppedImage();
              setState(() {});
            },
            icon: const Icon(Icons.check),
          ),
        ),
        SizedBox(width: 10.w),
      ],
    );
  }

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
}
