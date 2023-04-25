import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
   AuthButton({

required this.onPressed,
     required this.txtOnButton

  });
   VoidCallback? onPressed;
   String txtOnButton;
  @override
  Widget build(BuildContext context) {
    return ActionChip(
        elevation: 0,
        pressElevation: 20,
        backgroundColor: Colors.black,
        label:  Text("            $txtOnButton            ",style: const TextStyle(color: Colors.white),),
        onPressed:onPressed,
    );
  }
}
