import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task/configurations/frontend_configs.dart';
import 'package:test_task/infrastructure/services/post_services.dart';
import '../elements/list_card.dart';
import 'login_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
      body: _getUI(context),
    );
  }
}

Widget _getUI(BuildContext context) {
  final PostServices _postServices = PostServices();
  return SingleChildScrollView(
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

              ///checking if snapshot have data then show listview.builder otherwise show spinkit indicator
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
                      return ListCardWidget(
                        title: snapshot.data[i]['title'],
                        body: snapshot.data[i]['body'],
                      );
                    });
              }
            })
      ],
    ),
  );
}
