import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task/configurations/url_configs.dart';
import 'package:test_task/presentation/views/home_view.dart';
import '../../presentation/common/custom_dialog.dart';

import '../helper/error_handling.dart';
import '../models/login_model.dart';

class AuthServices {
  ///Login a User
  Future<LoginModel?> LoginUser(
      BuildContext context, String email, String password) async {
    var headers = {
      'Authorization': 'Basic aGFzc2FuLnphZmFyQHJvcHN0YW0uY29tOjEyMzQ1Njc4',
      'Cookie':
          'l8faNPJQY3k1b9O6lDIDduMl2t1JBp6EV4kI9FN4=eyJpdiI6IkJJejR3NldJZmwzTG50MVk3eVFHeFE9PSIsInZhbHVlIjoiQ3JmWnBKVDhlbUQ2QlB0RDh2RklcL1hqVWVCUXpNWUU2K1hRQW9yZjJFSSt2MHdWYUNxUzlyZnpKNVBpQlwvakFFOWc1eVwvcjRuNEZzcjBoeHlVRkx0V2dyZFpUY2J3T3FTYTdlQ1wvQ1lDamhQTVlIUnVkSkJJTm1VVmZhZHBUSlpBTGhSN1wvMHgyT3NPTFA2d3NhTkd1amdjWU0zN3RnWXZ4SkRpcDNITWxtMGc0XC8wd1RVaXJEdWhYZ0V5RnFMVHhhdnRZaHk1OEtBYTJcLzd2R2RvZWVkV3p0UlhjdXNRM2FTK3l3OFA0UU5HZDZJN1dEWWNMWDZHTVwvK1lZM1RtODNkSlBtVEd4UG94ZVYwbEY3RUJuUGVYVW11bkk3MW9cL3lGdERNRUNYaTNRSjM0cFBINnVlaFdqYkszVXdPSXZHOVJjYldYTmtKRkJrbUtNVmh2N2U0dnE4UXNLRzdNZEMzRm1HenZaYWE5VjFzPSIsIm1hYyI6ImE5ZTFhZGE2NTAyYTk3MDYyYjMyMzlkNGQ5OTc3ZmZjZmE3NWZmZDkxODM1ZWY5MjZhY2M0MzY2ZWFjNTQzYWYifQ%3D%3D; laravel_session=eyJpdiI6IndKTnloMVJ2YnFpNGo2T1BGRDRvSmc9PSIsInZhbHVlIjoidUJabEFTSjBFMTdoU3VYR1A4MlAyc2c5NkpVbFl1b2U3dU1qYm02NUZGUE9oUlAwZDlBNXhTNk1DbHpJU2pJXC9HSVpkaGxOMnd0bVp5UFAzaktVdjluWDN4VVdFRGtVcHVXVk5aQzc4REszeGZxMlpVREFwZlY5aG5Yb2E4TjNBIiwibWFjIjoiYTA1MTY3ZDMyYzNjZTAwODVmMjY4ODk5YzdlYTA4NTMxOTdkMWNmYjg1YjM0MGU3ZDJiYWMyZWU5NDBkMTM2MyJ9'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse(URlConfigs.loginbaseURL + URlConfigs.loginapiendpoint));
    request.fields.addAll({
      'email': email,
      'password': password,
      'device_token': 'zasdcvgtghnkiuhgfde345tewasdfghjkm'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var model;
    model = await response.stream.bytesToString();
    final decodeData = json.decode(model);
    print("Our Token");
    final statusofApi = decodeData['meta']['status'];
    final metaMessage = decodeData['meta']['message'];

    if (response.statusCode == 200) {
      if (statusofApi == 200) {
        ///declared a variable to get token from api
        var token = decodeData['data']['access_token'];
        ///setting a token in shared perefernce for session handling
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString("token", token);
        CustomDialog.customToast(metaMessage).whenComplete(() {
          Get.to(HomeView());
        });
      } else {
        ///custom dialog for showing error messages
        CustomDialog.customDialog(context, metaMessage);
      }
    } else {
      Provider.of<ErrorString>(context, listen: false)
          .saveErrorString('HI Hello');
      print(response.reasonPhrase);
    }
  }
}
