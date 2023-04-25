import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../screens/loginscreen.dart';

class checkAccountStatement extends StatelessWidget {
  checkAccountStatement({
    required this.leftTxt,
    required this.rightTxt,
    required this.pageName

  });
  String leftTxt;
  String rightTxt;
  String pageName;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text:  TextSpan(
        style: const TextStyle(color: Colors.black, fontSize: 18),
        children: <TextSpan>[
          TextSpan(text: '$leftTxt ? ', style: TextStyle(color: Colors.black)),
          TextSpan(
              onEnter: (value){
                Navigator.pop(context);
              },
              text: rightTxt, style: const TextStyle(decoration: TextDecoration.underline,color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
Navigator.pushNamed(context, '$pageName');                }


          )
        ],
      ),
    );
  }
}