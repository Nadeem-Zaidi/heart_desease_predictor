import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purple/screens/heart_data/heart_data.dart';
import '../../bloc/authentication_bloc.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var authBloc = BlocProvider.of<PhoneAuthBloc>(context);
    return HeartData();
  }
}
