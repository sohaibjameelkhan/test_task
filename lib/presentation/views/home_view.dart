import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task/configurations/frontend_configs.dart';
import 'package:test_task/infrastructure/services/post_services.dart';
import 'login_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PostServices _postServices = PostServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: FrontEndConfigs.whiteoclor,
        title: const Text(
          "Home Screen",
          style: TextStyle(color: FrontEndConfigs.blackcolor),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove("token");
                Fluttertoast.showToast(
                    msg: "Logout Sucessfully",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);

                Get.to(LoginView());

                Get.to(LoginView());
              },
              icon: Icon(
                Icons.login_outlined,
                color: FrontEndConfigs.blackcolor,
              ))
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            FutureBuilder<dynamic>(
                future: _postServices.ListAllPosts(context),
                // initialData: PostModel(),
                builder: (context, snapshot) {
                  print(snapshot);

                  if (snapshot.data == null) {
                    return const SpinKitWave(
                        size: 40,
                        color: FrontEndConfigs.appBaseColor,
                        type: SpinKitWaveType.start);
                  } else {
                    return ListView.builder(
                        padding: EdgeInsets.only(),
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                bottom: 5, left: 12, right: 12),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        height: 50,
                                        width: 250,
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                              style: GoogleFonts.roboto(
                                                  //fontFamily: 'Gilroy',
                                                  color: FrontEndConfigs
                                                      .blackcolor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13),
                                              text: snapshot.data[i]['title']),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        height: 50,
                                        width: 280,
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                              style: GoogleFonts.roboto(
                                                  //fontFamily: 'Gilroy',
                                                  color: FrontEndConfigs
                                                      .blackcolor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 9),
                                              text: snapshot.data[i]['body']),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                })
          ],
        ),
      ),
    );
  }
}
