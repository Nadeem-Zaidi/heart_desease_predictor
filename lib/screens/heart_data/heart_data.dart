import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purple/heart_bloc/heart_bloc.dart';
import 'package:purple/heart_bloc/heart_state.dart';
import 'package:purple/screens/heart_data/heart_data_helper_widget/heart_form_field.dart';
import 'package:purple/screens/heart_data/result_page.dart';
import 'package:purple/screens/mobile_screen_dimension/mobile_screen.dart';
import '../../business_logic/heart_fields.dart';

class HeartData extends StatefulWidget {
  HeartData({Key? key}) : super(key: key);

  @override
  State<HeartData> createState() => _HeartDataState();
}

class _HeartDataState extends State<HeartData> {
  @override
  void initState() {}

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var hb = BlocProvider.of<HeartDataBloc>(context);
    MobileScreen mobile = MobileScreen(context: context);
    return BlocConsumer<HeartDataBloc, HeartDataState>(
      bloc: hb,
      listener: (context, state) {
        if (state is HeartDataError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.error,
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
          );
          // return Container(child: Text("error occured"));
        }
      },
      builder: (context, state) {
        if (state is HeartDataLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
          );
        }
        if (state is HeartDataInitialState) {
          return HeartFormField(hb: hb);
        }

        if (state is HeartDataReceiveState) {
          return PredictedResultPage(
            riskMeter: state.dataReceived,
            hb: hb,
          );
        }

        return const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.red,
          ),
        );
      },
    );
  }
}
