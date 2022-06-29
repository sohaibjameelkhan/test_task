import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:test_task/configurations/url_configs.dart';

class PostServices {
  ///List Of Posts
  Future<dynamic> ListAllPosts(BuildContext context) async {
    try {
      var request = http.Request(
          'GET', Uri.parse(URlConfigs.postbasURL + URlConfigs.postApiEndPoint));

      http.StreamedResponse response = await request.send();
      final data = await response.stream.bytesToString();
      final decodeddata = jsonDecode(data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(decodeddata);
        return decodeddata;
      } else {
        throw "wrong";
      }
    } on SocketException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Please Check Your Internet Conection"),
              actions: <Widget>[
                TextButton(
                  child: Text('OKay'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    } catch (e) {
      throw e.toString();
    }
  }
}
