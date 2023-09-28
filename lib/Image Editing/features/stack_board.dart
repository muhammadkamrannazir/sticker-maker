import 'package:flutter/material.dart';
import 'package:stack_board/stack_board.dart';

// class CustomItem extends StackBoardItem {
//   const CustomItem({
//     required this.color,
//     Future<bool> Function()? onDel,
//     int? id, // <==== must
//   }) : super(
//           child: const Text('CustomItem'),
//           onDel: onDel,
//           id: id, // <==== must
//         );

//   final Color? color;

//   @override // <==== must
//   CustomItem copyWith({
//     CaseStyle? caseStyle,
//     Widget? child,
//     int? id,
//     Future<bool> Function()? onDel,
//     dynamic Function(bool)? onEdit,
//     bool? tapToEdit,
//     Color? color,
//   }) =>
//       CustomItem(
//         onDel: onDel,
//         id: id,
//         color: color ?? this.color,
//       );
// }

class StackBoardClass extends StatefulWidget {
  const StackBoardClass({Key? key}) : super(key: key);

  @override
  _StackBoardClassState createState() => _StackBoardClassState();
}

class _StackBoardClassState extends State<StackBoardClass> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Stack Board Demo'),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
            alignment: Alignment.center,
            child: const Text(
              'Custom item',
              style: TextStyle(color: Colors.white),
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 25),
                ],
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () => _boardController.clear(),
            child: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  Widget get _spacer => const SizedBox(width: 5);

  Future<bool> _onDel() async {
    final bool? r = await showDialog<bool>(
      context: context,
      builder: (_) {
        return Center(
          child: SizedBox(
            width: 400,
            child: Material(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 30),
                      child: Text('Are you sure want to close'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(
                          onPressed: () => Navigator.pop(context, true),
                          icon: const Icon(Icons.check),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context, false),
                          icon: const Icon(Icons.clear),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    return r ?? false;
  }
}

// class ItemCaseDemo extends StatefulWidget {
//   const ItemCaseDemo({Key? key}) : super(key: key);

//   @override
//   _ItemCaseDemoState createState() => _ItemCaseDemoState();
// }

// class _ItemCaseDemoState extends State<ItemCaseDemo> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         ItemCase(
//           isCenter: false,
//           child: const Text('Custom case'),
//           onDel: () async {},
//           onOperatStateChanged: (OperatState operatState) => null,
//           onOffsetChanged: (Offset offset) => null,
//           onSizeChanged: (Size size) => null,
//         ),
//       ],
//     );
//   }
// }
