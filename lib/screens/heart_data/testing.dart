import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';

class TestingForm extends StatelessWidget {
  Map<String, dynamic> source;
  int index;
  Function data;
  TestingForm(
      {Key? key, required this.source, required this.index, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> test = Map();
    String elementKey = source.keys.elementAt(index);
    var element = source.values.elementAt(index);

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: DropDownTextField(
        enableSearch: true,
        textFieldDecoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: elementKey,
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2, color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2, color: Theme.of(context).colorScheme.secondary),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2, color: Theme.of(context).colorScheme.error),
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
          // test[elementKey] = value.value.toString();
          data(elementKey, value.value.toString());
        },
      ),
    );
  }
}
