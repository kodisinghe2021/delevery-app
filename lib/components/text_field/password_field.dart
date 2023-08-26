import 'package:delever_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordField extends StatelessWidget {
  PasswordField({
    super.key,
    required this.textController,
    required this.hint,
    required this.prefix,
  });

  final TextEditingController textController;
  final IconData prefix;
  final String hint;

  //----------initializong controller
  final PasswordFieldController _controller =
      Get.put<PasswordFieldController>(PasswordFieldController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        controller: textController,
        obscureText: _controller.isObsecure.value,
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
          suffixIcon: IconButton(
            onPressed: () => _controller.changeObsecure(),
            icon: _controller.isObsecure.value
                ? const Icon(Icons.visibility_off_outlined)
                : const Icon(Icons.visibility_outlined),
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

class PasswordFieldController extends GetxController {
  RxBool isObsecure = RxBool(true);

  void changeObsecure() {
    isObsecure.value = !isObsecure.value;
  }
}
