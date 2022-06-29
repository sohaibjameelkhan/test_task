import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../configurations/frontend_configs.dart';

class ListCardWidget extends StatelessWidget {
  final String title;
  final String body;

  ListCardWidget({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, left: 12, right: 12),
      child: Container(
        height: 150,
        width: 300,
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 50,
                  width: 250,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: GoogleFonts.roboto(
                            //fontFamily: 'Gilroy',
                            color: FrontEndConfigs.blackcolor,
                            fontWeight: FontWeight.w600,
                            fontSize: 13),
                        text: title),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 50,
                  width: 280,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: GoogleFonts.roboto(
                            //fontFamily: 'Gilroy',
                            color: FrontEndConfigs.blackcolor,
                            fontWeight: FontWeight.w600,
                            fontSize: 9),
                        text: body),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
