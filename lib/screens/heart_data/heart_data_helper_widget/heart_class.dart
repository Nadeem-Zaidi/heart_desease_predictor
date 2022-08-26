import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HeartClass {
  String age;
  String height;
  String weight;
  String gender;
  String systolicBloodPresure;
  String diastolicBloodPresure;
  String cholestrol;
  String glucose;
  String smoking;
  String alcoholIntake;
  String physicalActivity;

  HeartClass(
      {required this.age,
      required this.height,
      required this.weight,
      required this.gender,
      required this.systolicBloodPresure,
      required this.diastolicBloodPresure,
      required this.cholestrol,
      required this.glucose,
      required this.smoking,
      required this.alcoholIntake,
      required this.physicalActivity});

  Map toJson() => {
        "age": age,
        "height": height,
        "weight": weight,
        "gender": gender,
        "systolic_blood_pressure": systolicBloodPresure,
        "diastolic_blood_pressure": diastolicBloodPresure,
        "cholestrol": cholestrol,
        "glucose": glucose,
        "smoking": smoking,
        "alcohol_intake": alcoholIntake,
        "physical_activity": physicalActivity
      };

  factory HeartClass.fromJson(Map<String, dynamic> parsed) {
    return HeartClass(
        age: parsed["age"]!,
        height: parsed["height"]!,
        weight: parsed["weight"]!,
        gender: parsed["Gender"]!,
        systolicBloodPresure: parsed["systolic_blood_pressure"]!,
        diastolicBloodPresure: parsed["Diatolic_blood_pressure"]!,
        cholestrol: parsed["cholestrol"]!,
        glucose: parsed["Glucose"]!,
        smoking: parsed["smoking"]!,
        alcoholIntake: parsed["Alcohol_intake"]!,
        physicalActivity: parsed["Physical_Activity"]!);
  }

  static FutureOr<dynamic> sendHeart(var data) async {
    try {
      var s = await http.post(Uri.parse("http://192.168.29.96:3000/"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: data);
      print(s.body);
      return jsonDecode(s.body);
    } catch (e) {
      rethrow;
    }
  }
}
