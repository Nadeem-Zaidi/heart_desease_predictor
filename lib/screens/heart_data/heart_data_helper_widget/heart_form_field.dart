import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:purple/heart_bloc/heart_bloc.dart';
import 'package:purple/screens/heart_data/heart_data_helper_widget/heart_class.dart';
import 'package:purple/screens/heart_data/testing.dart';
import 'package:purple/screens/mobile_screen_dimension/mobile_screen.dart';

import '../../../business_logic/heart_fields.dart';
import '../../../heart_bloc/heart_event.dart';

class HeartFormField extends StatelessWidget {
  HeartDataBloc hb;
  HeartFormField({Key? key, required this.hb}) : super(key: key);
  Map<String, String> collectData = Map();

  final _formKey = GlobalKey<FormState>();

  void addData(String key, String value) {
    collectData[key] = value;
  }

  void _submit(HeartDataBloc heartBloc) async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    // print("length of sc=${_scontroller.length}");
    // for (int i = 0; i < _scontroller.length; i++) {
    //   var data = heartInputs.keys.elementAt(i);
    //   test[data] = _scontroller[i].dropDownValue!.value;
    // }
    HeartClass hc = HeartClass.fromJson(collectData);
    String je = jsonEncode(hc);
    print(je);
    heartBloc.add(HeartDataSendEvent(dataToSend: je));
  }

  @override
  Widget build(BuildContext context) {
    MobileScreen mobile = MobileScreen(context: context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Heart Disease Predictor"),
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: mobile.height * .04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: const Text(
                    "Enter The Relevant Data ",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: mobile.height * .65,
            margin: EdgeInsets.only(
                top: mobile.height * .09,
                left: mobile.width * .03,
                right: mobile.width * .03),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                mobile.width * .035,
              ),
              // boxShadow: [
              //   const BoxShadow(
              //     color: Colors.grey,
              //     blurRadius: 30.0,
              //     spreadRadius: 1,
              //     offset: Offset(0, -10),
              //   ),
              // ],
              // color: Color.fromARGB(255, 230, 227, 227),
            ),
            child: Padding(
                padding: EdgeInsets.all(mobile.width * .02),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        heartInputs.length,
                        (index) => TestingForm(
                            source: heartInputs, index: index, data: addData),
                      ),
                    ),
                  ),
                )),
          ),
          GestureDetector(
            onTap: () {
              _submit(hb);
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: mobile.height * .75,
                  left: mobile.width * .03,
                  right: mobile.width * .03),
              height: mobile.height * .075,
              width: mobile.width * .95,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.primary),
              child: Text(
                "Predict",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
