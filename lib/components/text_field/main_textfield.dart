import 'package:delever_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainTextField extends StatelessWidget {
  MainTextField({
    super.key,
    required this.textController,
    required this.hint,
    required this.prefix,
    this.suffixVisibility,
  });

  final TextEditingController textController;
  final IconData prefix;
  final bool? suffixVisibility;
  final String hint;

  final MainTextFieldController _controller =
      Get.put(MainTextFieldController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        obscureText: !_controller.isObsecure.value,
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
          suffixIcon: Visibility(
            visible: suffixVisibility ?? false,
            child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: _controller.isObsecure.value
                    ? IconButton(
                        onPressed: () {
                          _controller.visibilityToggle();
                        },
                        icon: const Icon(Icons.visibility_outlined),
                      )
                    : IconButton(
                        onPressed: () {
                          _controller.visibilityToggle();
                        },
                        icon: const Icon(Icons.visibility_off_outlined),
                      )),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: kh3(),
            ), //<-- SEE HERE
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
    );
  }
}

class MainTextFieldController extends GetxController {
  RxBool isObsecure = RxBool(false);

  void visibilityToggle() {
    isObsecure.value = !isObsecure.value;
  }
}
