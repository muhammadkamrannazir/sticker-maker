import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;

class EmojisClass extends StatefulWidget {
  final onEmojSelected;
  EmojisClass({this.onEmojSelected, super.key});

  @override
  State<EmojisClass> createState() => _EmojisClassState();
}

class _EmojisClassState extends State<EmojisClass> {
  bool emojiShowing = false;
  final TextEditingController emojiFieldController = TextEditingController();
  _onBackspacePressed() {
    emojiFieldController
      ..text = emojiFieldController.text.characters.toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: emojiFieldController.text.length));
  }

  @override
  void dispose() {
    emojiFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: EmojiPicker(
        textEditingController: emojiFieldController,
        onEmojiSelected: (category, emoji) {
          if (widget.onEmojSelected != null) widget.onEmojSelected(emoji);
        },
        onBackspacePressed: _onBackspacePressed,
        config: Config(
          columns: 7,
          // Issue: https://github.com/flutter/flutter/issues/28894
          emojiSizeMax: 32 *
              (foundation.defaultTargetPlatform == TargetPlatform.iOS
                  ? 1.30
                  : 1.0),
          verticalSpacing: 0,
          horizontalSpacing: 0,
          gridPadding: EdgeInsets.zero,
          initCategory: Category.RECENT,
          bgColor: Colors.black,
          indicatorColor: Colors.blue,
          iconColor: Colors.grey,
          iconColorSelected: Colors.blue,
          backspaceColor: Colors.blue,
          skinToneDialogBgColor: Colors.white,
          skinToneIndicatorColor: Colors.grey,
          enableSkinTones: true,
          recentTabBehavior: RecentTabBehavior.RECENT,
          recentsLimit: 28,
          replaceEmojiOnLimitExceed: false,
          noRecents: const Text(
            'No Recents',
            style: TextStyle(fontSize: 20, color: Colors.black26),
            textAlign: TextAlign.center,
          ),
          loadingIndicator: const SizedBox.shrink(),
          tabIndicatorAnimDuration: kTabScrollDuration,
          categoryIcons: const CategoryIcons(),
          buttonMode: ButtonMode.CUPERTINO,
          checkPlatformCompatibility: true,
        ),
      ),
    );
  }
}

class CustomTextFieldTransparent extends StatelessWidget {
  const CustomTextFieldTransparent({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textFieldController = TextEditingController();
    return TextField(
      controller: textFieldController,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 20.0,
        color: Colors.white,
      ),
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        contentPadding:
            EdgeInsets.only(left: 16.0, bottom: 8.0, top: 8.0, right: 16.0),
        border: InputBorder.none,
      ),
    );
  }
}
