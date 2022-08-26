import 'package:flutter/material.dart';
import 'package:purple/bloc/authentication_bloc.dart';

class SignIn extends StatefulWidget {
  Function isThisScreen;
  PhoneAuthBloc authBloc;
  SignIn({Key? key, required this.isThisScreen, required this.authBloc})
      : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController mobileNumber = TextEditingController();
  TextEditingController countryCode = TextEditingController(text: "+91");
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    print(countryCode.text + mobileNumber.text);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.4,
      width: width,
      padding: const EdgeInsets.all(5),
      margin: EdgeInsets.only(top: height * 0.25),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                child: Row(children: [
                  Container(
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
                  SizedBox(width: 10),
                  Container(
                    width: width * 0.63,
                    child: TextFormField(
                      controller: mobileNumber,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter mobile number";
                        }
                        if (value.length > 10 || value.length < 10) {
                          return "Only 10 digits allowed";
                        }
                        return null;
                      },
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: height * 0.04,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                child: GestureDetector(
                  onTap: () {
                    _submit();
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        widget.authBloc.add(ESignUp());
                      },
                      child: const Text("Sign Up"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    countryCode.dispose();
    mobileNumber.dispose();
    super.dispose();
  }
}
