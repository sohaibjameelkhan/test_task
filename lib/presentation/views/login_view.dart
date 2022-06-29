import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:test_task/configurations/frontend_configs.dart';
import 'package:test_task/infrastructure/services/login_services.dart';
import '../common/common_button_widget.dart';
import '../common/textfieldwidget.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  AuthServices authServices = AuthServices();

  makeLoadingTrue() {
    isLoading = true;
    setState(() {});
  }

  makeLoadingFalse() {
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      progressIndicator: const SpinKitWave(
        size: 35,
        color: FrontEndConfigs.appBaseColor,
      ),
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            Text("Sign in.",
                style: GoogleFonts.inter(
                    // fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600,
                    fontSize: 26)),
            const SizedBox(
              height: 90,
            ),
            TextFieldWidget(
              hinttext: "Email",
              authcontroller: _emailController,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              hinttext: "Password",
              authcontroller: _passwordController,
            ),
            const SizedBox(
              height: 40,
            ),
            CommonButtonWidget(
                text: "Sign In",
                onTap: () async {
                  makeLoadingTrue();
                  authServices.LoginUser(context, _emailController.text,
                          _passwordController.text)
                      .whenComplete(() async {
                    makeLoadingFalse();
                  });
                })
          ],
        ),
      ),
    );
  }
}
