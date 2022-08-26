import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purple/bloc/authentication_bloc.dart';
import 'package:purple/business_logic/heart_fields.dart';
import 'package:purple/heart_bloc/heart_bloc.dart';
import 'package:purple/heart_bloc/heart_event.dart';
import 'package:purple/heart_bloc/heart_state.dart';
import 'package:purple/repository/auth_repository.dart';
import 'package:purple/repository/phone_auth_repository.dart';
import 'package:purple/screens/authentication/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:purple/screens/heart_data/heart_data.dart';
import 'package:purple/screens/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  String? _phone;
  @override
  void initState() {
    FirebaseAuth fauth = FirebaseAuth.instance;
    _phone = fauth.currentUser?.phoneNumber;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PhoneAuthRepository auth = PhoneAuthRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider<PhoneAuthBloc>(
          create: (BuildContext context) =>
              PhoneAuthBloc(phoneAuthRepository: auth),
        ),
        BlocProvider<HeartDataBloc>(
          create: (BuildContext context) => HeartDataBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme(
                primary: Colors.purple.shade400,
                onPrimary: Colors.white,
                secondary: Colors.amber,
                onSecondary: Colors.white,
                error: Colors.red,
                onError: Colors.white,
                background: Colors.amber,
                onBackground: Colors.white,
                surface: Colors.blue,
                onSurface: Colors.white,
                brightness: Brightness.light)),
        home: _phone == null ? AuthenticationScreen() : Home(),
      ),
    );
  }
}
