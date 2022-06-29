import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_task/configurations/frontend_configs.dart';

class CommonButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  CommonButtonWidget({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            color: FrontEndConfigs.blackcolor,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Center(
            child: Text(text,
                style: GoogleFonts.inter(
                    // fontFamily: 'Gilroy',
                    color: FrontEndConfigs.whiteoclor,
                    fontWeight: FontWeight.w500,
                    fontSize: 17)),
          ),
        ),
      ),
    );
  }
}
