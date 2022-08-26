import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:purple/bloc/authentication_bloc.dart';
import 'package:purple/repository/phone_auth_repository.dart';

class SignUp extends StatefulWidget {
  Function isThisScreen;
  PhoneAuthBloc authBloc;
  SignUp({Key? key, required this.isThisScreen, required this.authBloc})
      : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController name = TextEditingController();
  TextEditingController countryCode = TextEditingController(text: "+91");

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.5,
      width: width,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: height * 0.20),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Form(
          child: Column(children: [
            TextFormField(
              controller: name,
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: TextStyle(fontSize: 22),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.blue),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.blue),
                    borderRadius: BorderRadius.circular(20)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            Row(children: [
              SizedBox(
                width: width * 0.20,
                child: TextFormField(
                  controller: countryCode,
                  readOnly: true,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: width * 0.63,
                child: TextFormField(
                  controller: mobileNumber,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    labelText: "Mobile Number",
                    labelStyle: const TextStyle(fontSize: 22),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                print(countryCode.text + mobileNumber.text);
                String phoneNumberWithCode =
                    countryCode.text + mobileNumber.text;

                widget.authBloc.add(SendOtpToPhoneEvent(
                    phoneNumber: phoneNumberWithCode.trim()));
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
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(width: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?->"),
                TextButton(
                    onPressed: () {
                      widget.authBloc.add(ESignIn());
                    },
                    child: Text("Sign In"))
              ],
            )
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    countryCode.dispose();
    mobileNumber.dispose();
    name.dispose();
    super.dispose();
  }
}
