import 'package:flutter/material.dart';

class RowDivider extends StatelessWidget {
  final double height;
  final double width;

  const RowDivider({
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Colors.grey.shade300,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }
}
