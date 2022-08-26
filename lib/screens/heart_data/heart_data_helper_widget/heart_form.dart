import 'dart:convert';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:purple/business_logic/heart_fields.dart';
import 'package:purple/business_logic/send_heart.dart';
import 'package:purple/screens/heart_data/heart_data_helper_widget/heart_class.dart';
import 'package:purple/screens/mobile_screen_dimension/mobile_screen.dart';

import '../../../helper_widget_function/custom_text_field.dart';
import 'package:select_form_field/select_form_field.dart';

class HeartForm extends StatefulWidget {
  HeartForm({Key? key}) : super(key: key);

  @override
  State<HeartForm> createState() => _HeartFormState();
}

class _HeartFormState extends State<HeartForm> {
  TextEditingController age = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  SendHeart heart = SendHeart();

  List<TextEditingController> _controller = [];

  final Map<TextEditingController, TextEditingController> _controllermap =
      Map();
  late SingleValueDropDownController _cnt = SingleValueDropDownController();
  List<SingleValueDropDownController> _scontroller = [];
  Map<String, SingleValueDropDownController> _sst = Map();
  Map<String, String> result = Map();
  Map<String, String> test = Map();

  @override
  void initState() {
    // _cnt = SingleValueDropDownController();
  }
  @override
  void dispose() {
    for (var element in _controller) {
      element.dispose();
    }
    age.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MobileScreen mobile = MobileScreen(context: context);

    void _submit() {
      final isValid = _formKey.currentState!.validate();
      if (!isValid) {
        return;
      }
      _formKey.currentState!.save();
      print(test);
      // print("length of sc=${_scontroller.length}");
      // for (int i = 0; i < _scontroller.length; i++) {
      //   var data = heartInputs.keys.elementAt(i);
      //   test[data] = _scontroller[i].dropDownValue!.value;
      // }
      HeartClass hc = HeartClass.fromJson(test);
      String je = jsonEncode(hc);
      print(je);
      HeartClass.sendHeart(je);

      _scontroller.forEach((element) {
        element.clearDropDown();
      });
      _scontroller.clear();
      setState(() {});
    }

    List<Widget> renderTextField(var source, int index) {
      return List.generate(
        heartInputs.length,
        (index) {
          var element = source.values.elementAt(index);
          var elementKey = source.keys.elementAt(index);

          // _scontroller.add(SingleValueDropDownController());

          return Container(
            margin: EdgeInsets.only(
                top: mobile.height * .012,
                left: mobile.width * .01,
                right: mobile.width * .01),
            child: DropDownTextField(
              enableSearch: true,
              singleController: _sst[elementKey],
              textFieldDecoration: InputDecoration(
                  labelText: elementKey,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(20),
                  )),
              dropDownList: List.generate(
                element.length,
                (index) => DropDownValueModel(
                  name: element[index]["name"],
                  value: element[index]["value"],
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Fields can not be empty";
                }
                return null;
              },
            ),
          );
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: mobile.height,
        margin: EdgeInsets.only(top: mobile.height * 0.10),
        width: mobile.width - 10,
        padding: EdgeInsets.all(mobile.width * 0.0264),
        child: Column(children: [
          const Text(
            "Predict Heart Desease",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Container(
            height: mobile.height * .8,
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: List.generate(
                    heartInputs.length,
                    (index) {
                      print("running list generator");
                      var element = heartInputs.values.elementAt(index);
                      var elementKey = heartInputs.keys.elementAt(index);
                      // _scontroller.add(SingleValueDropDownController());
                      _sst[elementKey] = SingleValueDropDownController();
                      return Container(
                        margin: EdgeInsets.only(
                            top: mobile.height * .012,
                            left: mobile.width * .01,
                            right: mobile.width * .01),
                        child: DropDownTextField(
                          enableSearch: true,
                          textFieldDecoration: InputDecoration(
                            labelText: elementKey,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(width: 2, color: Colors.red),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          dropDownList: List.generate(
                            element.length,
                            (index) => DropDownValueModel(
                              name: element[index]["name"],
                              value: element[index]["value"],
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Fields can not be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            test[elementKey] = value.value.toString();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _submit();
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
