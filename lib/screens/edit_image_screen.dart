import 'dart:io';
import 'package:crop_image/crop_image.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:stack_board/stack_board.dart';
import 'package:sticker_maker/features/emojis.dart';
import 'package:sticker_maker/features/stickers.dart';
import 'package:sticker_maker/screens/home.dart';
import 'package:sticker_maker/widgets/custom_text.dart';
import '../utils/colors.dart';
import '../widgets/Custom_Button.dart';
import '../widgets/edit_image_viewmodel.dart';
import '../widgets/toggle_button.dart';
import 'package:flutter/foundation.dart' as foundation;

class EditImageScreen extends StatefulWidget {
  // final File selectedImage;
  const EditImageScreen({
    Key? key,
    // required this.selectedImage,
  }) : super(key: key);

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

  setCallBack() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyShade900,
      appBar: _appBar,
      body: Column(
        children: [
          Expanded(
            child: Screenshot(
              controller: screenshotController,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    StackBoard(
                      controller: _boardController,
                      caseStyle: const CaseStyle(
                        borderColor: Colors.grey,
                        iconColor: Colors.white,
                      ),
                      background: const ColoredBox(color: Colors.transparent),
                    ),
                    const CustomTextFieldTransparent(),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              const Divider(color: Colors.white),
              toggleButtonIndex == 0 ? imageOptions() : const SizedBox(),
              toggleButtonIndex == 1 ? textOptions() : const SizedBox(),
              toggleButtonIndex == 2 ? addNewOptions() : const SizedBox(),
              // toggleButtonIndex == 3
              //     ? EmojisClass(onEmojSelected: (Emoji emoji) {
              //         _boardController
              //             .add(StackBoardItem(child: Text(emoji.emoji)));
              //         // emoji.emoji;
              //       })
              //     : const SizedBox(),
              toggleButtonIndex == 4
                  ? StickerClass(
                      onTap: (value) {
                        _boardController
                            .add(StackBoardItem(child: Image.asset(value)));
                      },
                    )
                  : const SizedBox(),
              Divider(color: AppColors.primary),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    ToggleButtonGroup(
                      buttonIcons: const [
                        Icons.crop,
                        CupertinoIcons.textformat,
                        CupertinoIcons.add,
                        Icons.emoji_emotions,
                        Icons.emoji_flags_rounded,
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
        ],
      ),
    );
  }

  int toggleButtonIndex = 0;
  File? imagefile;

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
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Get.off(HomePage());
            },
          )
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
          FloatingActionButton.small(
            backgroundColor: Colors.white,
            onPressed: () {
              _boardController.add(
                const AdaptiveText(
                  'New Text',
                  tapToEdit: true,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              );
            },
            child: const Icon(
              Icons.text_fields_rounded,
              color: Colors.black,
            ),
          ),
          FloatingActionButton.small(
            // onPressed: () => _boardController.add(addNewDialog(context)),
            onPressed: () {
              _boardController.add(
                const AdaptiveText(
                  'New Text',
                  tapToEdit: true,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              );
            },
            backgroundColor: Colors.white,
            tooltip: 'Add New Text',
            child: const Icon(
              CupertinoIcons.add,
              color: Colors.black,
            ),
          ),
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton.small(
            backgroundColor: Colors.white,
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
            child: const Icon(
              Icons.image,
              color: Colors.black,
            ),
          ),
          FloatingActionButton.small(
            backgroundColor: Colors.white,
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
            child: const Icon(
              Icons.color_lens,
              color: Colors.black,
            ),
          ),
          FloatingActionButton.small(
            onPressed: () async {
              Imagepickerchoicedialog(context);
            },
            child: const Icon(
              CupertinoIcons.add,
            ),
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
        FloatingActionButton.small(
          backgroundColor: AppColors.white,
          onPressed: () async {
            await controller.croppedImage();
            setState(() {});
          },
          child: const Icon(
            Icons.check,
            color: Colors.black,
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

  Future<dynamic> Imagepickerchoicedialog(context) async {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        final ImagePicker picker = ImagePicker();
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: CupertinoButton.filled(
                    minSize: 60,
                    child: CustomText('Gallery'),
                    onPressed: () async {
                      XFile? photo =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (photo != null) {
                        imagefile = File(photo.path);
                        _boardController.add(
                          StackBoardItem(
                            child: Image.file(
                              File(imagefile!.path),
                            ),
                          ),
                        );
                        setCallBack();
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            Container(height: 1, color: Colors.black),
            Row(
              children: [
                Expanded(
                  child: CupertinoButton.filled(
                    minSize: 60,
                    child: CustomText('Camera'),
                    onPressed: () async {
                      XFile? photo =
                          await picker.pickImage(source: ImageSource.camera);
                      if (photo != null) {
                        imagefile = File(photo.path);

                        _boardController.add(
                          StackBoardItem(
                            child: Image.file(
                              File(imagefile!.path),
                            ),
                          ),
                        );
                        setCallBack();
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
          ],
        );
      },
    );
  }
}
