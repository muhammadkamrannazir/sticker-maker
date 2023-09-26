import 'package:flutter/material.dart';

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RotateText(),
    );
  }
}

class RotateText extends StatefulWidget {
  const RotateText({super.key});

  @override
  _RotateTextState createState() => _RotateTextState();
}

class _RotateTextState extends State {
  double finalAngle = 0.0;
  double oldAngle = 0.0;
  double upsetAngle = 0.0;
  double textfinalAngle = 0.0;
  double textoldAngle = 0.0;
  double textupsetAngle = 0.0;
  @override
  Widget build(BuildContext context) {
    return _defaultApp(context);
  }

  _defaultApp(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Single finger Rotate text'),
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  Offset centerOfGestureDetector = Offset(
                    constraints.maxWidth / 2,
                    constraints.maxHeight / 2,
                  );
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onPanStart: (details) {
                      final touchPositionFromCenter =
                          details.localPosition - centerOfGestureDetector;
                      upsetAngle = oldAngle - touchPositionFromCenter.direction;
                    },
                    onPanEnd: (details) {
                      setState(
                        () {
                          oldAngle = finalAngle;
                        },
                      );
                    },
                    onPanUpdate: (details) {
                      final touchPositionFromCenter =
                          details.localPosition - centerOfGestureDetector;
                      setState(
                        () {
                          finalAngle =
                              touchPositionFromCenter.direction + upsetAngle;
                        },
                      );
                    },
                    child: Transform.rotate(
                      angle: finalAngle,
                      child: SizedBox(
                        height: 100.0,
                        width: 100.0,
                        child: Image.network(
                          'https://picsum.photos/250?image=9',
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Center(
            child: Container(
              // width: 250,
              // height: 250,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(30.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  Offset centerOfGestureDetector = Offset(
                      constraints.maxWidth / 2, constraints.maxHeight / 2);
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onPanStart: (details) {
                      final touchPositionFromCenter =
                          details.localPosition - centerOfGestureDetector;
                      textupsetAngle =
                          textoldAngle - touchPositionFromCenter.direction;
                    },
                    onPanEnd: (details) {
                      setState(
                        () {
                          textoldAngle = textfinalAngle;
                        },
                      );
                    },
                    onPanUpdate: (details) {
                      final touchPositionFromCenter =
                          details.localPosition - centerOfGestureDetector;
                      setState(
                        () {
                          textfinalAngle = touchPositionFromCenter.direction +
                              textupsetAngle;
                        },
                      );
                    },
                    child: Transform.rotate(
                      angle: textfinalAngle,
                      child: const Text(
                        "Waheed Hussain",
                        style: TextStyle(color: Colors.blue, fontSize: 30),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
