import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';

class AnimatedEmojClass extends StatelessWidget {
  const AnimatedEmojClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Emoji')),
      body: const Center(
        child: Column(
          children: [
            AnimatedEmoji(
              AnimatedEmojis.rocket,
              size: 128,
            ),
            AnimatedEmoji(
              AnimatedEmojis.smile,
              size: 128,
              repeat: true,
            ),
            AnimatedEmoji(
              AnimatedEmojis.clap,
              size: 128,
            ),
            DemoHoverEmoji(),
          ],
        ),
      ),
    );
  }
}

/// Demo widget that demonstrates how to use [AnimationController] with [AnimatedEmoji].
class DemoHoverEmoji extends StatefulWidget {
  /// Demo widget that demonstrates how to use [AnimationController] with [AnimatedEmoji].
  const DemoHoverEmoji({super.key});

  @override
  State<DemoHoverEmoji> createState() => _DemoHoverEmojiState();
}

class _DemoHoverEmojiState extends State<DemoHoverEmoji>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        controller.forward(from: 0);
      },
      child: AnimatedEmoji(
        AnimatedEmojis.brokenHeart,
        controller: controller,
        size: 128,
        onLoaded: (duration) {
          // Get the duration of the animation.
          controller.duration = duration;
        },
      ),
    );
  }
}
