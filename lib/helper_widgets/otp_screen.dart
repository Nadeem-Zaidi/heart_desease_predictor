import 'dart:async';

import 'package:flutter/material.dart';
import 'package:purple/bloc/authentication_bloc.dart';
import 'package:purple/repository/phone_auth_repository.dart';

class OTPScreen extends StatefulWidget {
  Function isThisScreen;
  PhoneAuthBloc authBloc;
  OTPScreen({Key? key, required this.isThisScreen, required this.authBloc})
      : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;

  final TextEditingController otpcode = TextEditingController();

  // @override
  // initState() {
  //   super.initState();
  //   timer = Timer.periodic(Duration(seconds: 1), (_) {
  //     if (secondsRemaining != 0) {
  //       setState(() {
  //         secondsRemaining--;
  //       });
  //     } else {
  //       setState(() {
  //         enableResend = true;
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.4,
      width: width,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: height * 0.25),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: otpcode,
                decoration: InputDecoration(
                  labelText: "Enter OTP Here",
                  labelStyle: const TextStyle(fontSize: 22),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.blue),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.blue),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  widget.authBloc.add(
                    VerifySentOtpEvent(
                      otpCode: otpcode.text.trim(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: height * 0.04,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: const Text(
                    "Send OTP",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text("Don't have an account?"),
              //     TextButton(onPressed: () {}, child: Text("Send OTP"))
              //   ],
              // )

              enableResend
                  ? ElevatedButton(
                      child: Text('Resend Code'),
                      onPressed: () {},
                    )
                  : Text(
                      'after $secondsRemaining seconds',
                      style: TextStyle(color: Colors.blue, fontSize: 22),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
