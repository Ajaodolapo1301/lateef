import 'package:flutter/material.dart';

class MessageRootWidget extends StatelessWidget {
  final bool isCurrent;
  final int index;

  const MessageRootWidget(
      {required Key key, required this.isCurrent, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !isCurrent,
      child: Scaffold(
          backgroundColor: Colors.white, body: Center(child: Text("Message"))),
    );
  }
}
