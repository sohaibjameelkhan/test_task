import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task/presentation/views/home_view.dart';
import 'package:test_task/presentation/views/login_view.dart';
import '../../configurations/frontend_configs.dart';

String? finalEmail;

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValidationData().whenComplete(() async {
      Timer(
          const Duration(seconds: 2),
          () => Get.to(
              finalEmail == null ? const LoginView() : const HomeView()));
    });
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString("token");
    setState(() {
      finalEmail = obtainedEmail;
    });
    print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: SpinKitWave(
              size: 35,
              color: FrontEndConfigs.appBaseColor,
            ),
          )
        ],
      ),
    );
  }
}
