import 'package:delever_app/constant.dart';
import 'package:flutter/material.dart';

class DragLine extends StatelessWidget {
  const DragLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: 40,
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: kh3(),
      ),
    );
  }
}
