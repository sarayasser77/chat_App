
import 'package:bloc/bloc.dart';
import 'package:chat_app/view/FirebaseManager/states/userstates.dart';
import 'package:chat_app/view/shared/toastmsg/toastmsg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserStates>{
  UserCubit():super(InitialStates());
  static UserCubit getInstance(BuildContext context){
    return BlocProvider.of(context);
  }
 void userRegister(String email,String password,String userName,String phone) async{
    try{
      UserCredential user =await FirebaseAuth.instance.createUserWithEmailAndPassword
        (email: email, password: password);
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch(e){
  if (e.message=='weak-password'){
    getFlutterToast('weak password', Colors.black);
  }else if(e.message=='email-already-in-use'){
    getFlutterToast('email already existed', Colors.black);
    emit(RegisterFailedState());
  }
  else{
    getFlutterToast('created', Colors.black);

  }
  }
  }


}

