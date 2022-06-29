import 'package:flutter/material.dart';
import 'package:test_task/configurations/frontend_configs.dart';

class TextFieldWidget extends StatelessWidget {
  final String hinttext;
  final TextEditingController authcontroller;



  TextFieldWidget({required this.hinttext, required this.authcontroller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            border: Border.all(
                width: 1.5,
                color: FrontEndConfigs.blackcolor.withOpacity(0.8))),
        child: TextFormField(
          controller: authcontroller,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 15, bottom: 2),
              border: InputBorder.none,
              hintText: hinttext,
              hintStyle: const TextStyle(color: FrontEndConfigs.blackcolor)),
        ),
      ),
    );
  }
}
