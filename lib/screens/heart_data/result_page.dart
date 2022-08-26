import "package:flutter/material.dart";
import 'package:purple/heart_bloc/heart_bloc.dart';
import 'package:purple/heart_bloc/heart_event.dart';
import 'package:purple/screens/mobile_screen_dimension/mobile_screen.dart';

class PredictedResultPage extends StatelessWidget {
  String riskMeter;
  HeartDataBloc hb;
  PredictedResultPage({Key? key, required this.riskMeter, required this.hb})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MobileScreen mobile = MobileScreen(context: context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            hb.add(HeartDataInitialEvent());
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: const Text("Heart Disease Predictor"),
      ),
      body: Container(
          child: Column(
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                height: mobile.height * .2,
                width: double.infinity,
                margin: EdgeInsets.only(top: mobile.height * .09),
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(mobile.width * .05),
                ),
                child: Text(
                  "you are having ${double.parse(riskMeter) * 100} % chance of Heart Disease",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: mobile.height * .2,
                width: mobile.width * double.parse(riskMeter),
                margin: EdgeInsets.only(top: mobile.height * .09),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(mobile.width * .05),
                  color: double.parse(riskMeter) >= .5
                      ? Colors.red.withOpacity(0.5)
                      : Colors.green.withOpacity(0.5),
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
