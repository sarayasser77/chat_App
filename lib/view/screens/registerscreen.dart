import 'package:chat_app/view/FirebaseManager/cubit/usercubit.dart';
import 'package:chat_app/view/FirebaseManager/states/userstates.dart';
import 'package:chat_app/view/screens/loginscreen.dart';
import 'package:chat_app/view/widgets/textfiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/AuthButton.dart';
import '../widgets/checkAccountexist.dart';
class RegisterScreen extends StatelessWidget {

  static String id='registerScreen';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var phoneController=TextEditingController();
  var userNameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit,UserStates>(
      builder: (BuildContext context, state) {
        UserCubit cubit=BlocProvider.of(context);
        return  Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Image.asset('images/register.png',height: 190,width: 190,),
                  TextFieldAuth(textonformfield: 'Email', textonvalidation: 'Please Enter your email', controller: emailController, isobsecure: false,),
                  TextFieldAuth(textonformfield: 'password', textonvalidation: 'Please Enter your password', controller: passwordController, isobsecure: true,checkPass: true,),
                  TextFieldAuth(textonformfield: 'phone', textonvalidation: 'Please Enter your phone', controller: phoneController, isobsecure: false),
                  TextFieldAuth(textonformfield: 'userName', textonvalidation: 'Please Enter your User Name', controller: userNameController, isobsecure: false),
                  const SizedBox(height: 5,),
                  checkAccountStatement(
                    leftTxt: 'Have already an account',
                    rightTxt: 'login',
                             pageName: LoginScreen.id,                  ) ,

                  AuthButton(onPressed: (){
                    if(_formKey.currentState!.validate()==true){
                      cubit.userRegister(emailController.text, passwordController.text, userNameController.text, phoneController.text);
                    }

                  }
               , txtOnButton: 'Register',),
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



