import 'package:delever_app/constant.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textController,
    required this.hint,
    required this.prefix,
  });

  final TextEditingController textController;
  final IconData prefix;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 15.0,
          color: kh3(),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
          child: Icon(
            prefix,
            color: kicon(),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: kh3(),
          ), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
