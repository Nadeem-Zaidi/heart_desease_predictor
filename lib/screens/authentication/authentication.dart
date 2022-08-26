import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purple/bloc/authentication_bloc.dart';
import 'package:purple/helper_widgets/otp_screen.dart';
import 'package:purple/helper_widgets/sign_in.dart';
import 'package:purple/helper_widgets/sign_up.dart';

import '../home/home.dart';

class AuthenticationScreen extends StatefulWidget {
  AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool isSignUp = true;
  @override
  Widget build(BuildContext context) {
    print("running authentication screen");
    var authBloc = BlocProvider.of<PhoneAuthBloc>(context);
    void changeScreen() {
      setState(() {
        isSignUp = !isSignUp;
      });
    }

    return Scaffold(
      body: BlocConsumer<PhoneAuthBloc, AuthenticationState>(
        bloc: authBloc,
        listener: (context, state) {
          if (state is PhoneAuthVerified) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => Home(),
              ),
            );
          }

          if (state is PhoneAuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is PhoneAuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PhoneAuthCodeSentSuccess) {
            return OTPScreen(
              isThisScreen: changeScreen,
              authBloc: authBloc,
            );
          }
          if (state is LogoutState) {
            SignUp(
              isThisScreen: changeScreen,
              authBloc: authBloc,
            );
          }

          return SignUp(
            isThisScreen: changeScreen,
            authBloc: authBloc,
          );
        },
      ),
    );
  }
}
