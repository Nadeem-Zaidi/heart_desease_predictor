import 'package:flutter/widgets.dart';

List<String> heart_data = [
  "Smoking",
  "Alcohol_Drinking?",
  "Stroke",
  "Diff In Walking?",
  "Diabetic?",
  "Physical_Activity",
  "Asthma",
  "Kidney Disease?",
  "Skin_Cancer",
  "BMI",
  "Physical_Health",
  "Mental_Health",
  "Age_Category",
  "Gen_Health",
  "Sleep_Time",
  "Gender",
  "Race"
];

Map<String, String> heartData() {
  Map<String, String> heart_map = Map();
  heart_data.forEach((element) {
    heart_map[element] = element;
  });
  return heart_map;
}

// Map<String, List> heartInputs = {
//   "Smoking": [
//     {"name": "yes", "value": "1"},
//     {"name": "No", "value": "0"}
//   ],
//   "Alcohol_Drinking?": [
//     {"name": "yes", "value": "1"},
//     {"name": "No", "value": "0"}
//   ],
//   "Stroke": [
//     {"name": "yes", "value": "1"},
//     {"name": "No", "value": "0"}
//   ],
//   "Diff In Walking?": [
//     {"name": "yes", "value": "1"},
//     {"name": "No", "value": "0"}
//   ],
//   "Diabetic?": [
//     {"name": "yes", "value": "1"},
//     {"name": "No", "value": "0"}
//   ],
//   "Physical_Activity": [
//     {"name": "yes", "value": "1"},
//     {"name": "No", "value": "0"}
//   ],
//   "Asthma": [
//     {"name": "yes", "value": "1"},
//     {"name": "No", "value": "0"}
//   ],
//   "Kidney Disease?": [
//     {"name": "yes", "value": "1"},
//     {"name": "No", "value": "0"}
//   ],
//   "Skin_Cancer": [
//     {"name": "yes", "value": "1"},
//     {"name": "No", "value": "0"}
//   ],
//   "Age_Category": [
//     {"name": "18-24", "value": "1"},
//     {"name": "25-29", "value": "2"},
//     {"name": "30-34", "value": "3"},
//     {"name": "35-39", "value": "4"},
//     {"name": "40-44", "value": "5"},
//     {"name": "45-49", "value": "6"},
//     {"name": "50-54", "value": "7"},
//     {"name": "55-59", "value": "8"},
//     {"name": "60-64", "value": "9"},
//     {"name": "65-69", "value": "10"},
//     {"name": "70-74", "value": "11"},
//     {"name": "75-80", "value": "12"},
//     {"name": "80-Above", "value": "13"},
//   ],
//   "Gen_Health": [
//     {"name": "Good Health", "value": "1"},
//     {"name": "Fair", "value": "2"},
//     {"name": "Poor", "value": "3"},
//   ],
//   "Sleep_Time": [
//     {"name": "Male", "value": "Male"},
//     {"name": "Female", "value": "Female"}
//   ],
//   "Gender": [
//     {"name": "Male", "value": "Male"},
//     {"name": "Female", "value": "Female"}
//   ],
//   "Race": [
//     {"name": "American", "value": "American"},
//     {"name": "Indian", "value": "Indian"}
//   ],
// };

Map<String, dynamic> heartInputs = {
  "age": List.generate(
      100, (index) => {"name": "${index + 20}", "value": "${index + 20}"}),
  "height": List.generate(
      300, (index) => {"name": "${index + 100}", "value": "${index + 100}"}),
  "weight": List.generate(
      300, (index) => {"name": "${index + 20}", "value": "${index + 20}"}),
  "systolic_blood_pressure": List.generate(
      400, (index) => {"name": "${index + 50}", "value": "${index + 50}"}),
  "Diatolic_blood_pressure": List.generate(
      400, (index) => {"name": "${index + 50}", "value": "${index + 50}"}),
  "Gender": [
    {"name": "male", "value": "1"},
    {"name": "female", "value": "2"}
  ],
  "cholestrol": [
    {"name": "normal", "value": "1"},
    {"name": "above_normal", "value": "2"},
    {"name": "well_above_normal", "value": "3"},
  ],
  "Glucose": [
    {"name": "normal", "value": "1"},
    {"name": "above_normal", "value": "2"},
    {"name": "well_above_normal", "value": "3"},
  ],
  "smoking": [
    {"name": "yes", "value": "1"},
    {"name": "no", "value": "0"},
  ],
  "Alcohol_intake": [
    {"name": "yes", "value": "1"},
    {"name": "no", "value": "0"},
  ],
  "Physical_Activity": [
    {"name": "yes", "value": "1"},
    {"name": "no", "value": "0"},
  ]
};
