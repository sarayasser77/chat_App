import 'package:chat_app/view/FirebaseManager/cubit/usercubit.dart';
import 'package:chat_app/view/screens/loginscreen.dart';
import 'package:chat_app/view/screens/registerscreen.dart';
import 'package:chat_app/view/shared/observer/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  Bloc.observer=MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context)=>UserCubit())],
      child: MaterialApp(
        routes: {
          LoginScreen.id:(context)=>LoginScreen(),
          RegisterScreen.id:(context)=>RegisterScreen(),
        },
        debugShowCheckedModeBanner: false,
        home:LoginScreen()
      ),
    );
  }
}


