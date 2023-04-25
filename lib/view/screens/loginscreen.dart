import 'package:chat_app/view/FirebaseManager/cubit/usercubit.dart';
import 'package:chat_app/view/FirebaseManager/states/userstates.dart';
import 'package:chat_app/view/screens/registerscreen.dart';
import 'package:chat_app/view/widgets/AuthButton.dart';
import 'package:chat_app/view/widgets/textfiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/checkAccountexist.dart';
class LoginScreen extends StatefulWidget {
  static String id='loginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(debugLabel: 'logins');
  var emailController=TextEditingController();
  var passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserCubit cubit =BlocProvider.of(context);
    return BlocConsumer<UserCubit,UserStates>(
      builder: (BuildContext context, state) { return Scaffold(
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Spacer(),
                Image.asset('images/login.png',height: 150,width: 150,),
                TextFieldAuth(textonformfield: 'Email', textonvalidation: 'Email', controller: emailController, isobsecure: false),
                TextFieldAuth(textonformfield: 'password', textonvalidation: 'password', controller: passwordController, isobsecure: true),
                const SizedBox(height: 5,),
                checkAccountStatement(
                  leftTxt: 'Make new account',
                  rightTxt: 'Register',
                  pageName: RegisterScreen.id,                  ),
                const SizedBox(height: 5),
                AuthButton(onPressed: (){
                  if(_formKey.currentState!.validate()==true){
                    // cubit.userRegister(emailController.text, passwordController.text)
                  }

                }
                  , txtOnButton: 'login',),
                Spacer(flex: 2,)
              ],
            ),
          ),
        ),
      );
        },
      listener: (BuildContext context, Object? state) {  },

    );
  }
}
