import 'package:delever_app/constant.dart';
import 'package:flutter/material.dart';

class MarkerDot extends StatelessWidget {
  const MarkerDot({
    required this.imgURL,
    super.key,
  });
  final String imgURL;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kLight().withOpacity(.5),
      ),
      child: Image.network(
        imgURL,
        fit: BoxFit.cover,
      ),
    );
  }
}
