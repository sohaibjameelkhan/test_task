import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomDialog {
  static customDialog(BuildContext context, metaMessage) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(metaMessage),
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
  }

  static Future<bool?> customToast(metaMessage) {
    return Fluttertoast.showToast(
        msg: "Login " + metaMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
