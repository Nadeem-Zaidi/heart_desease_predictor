import 'package:flutter/widgets.dart';

class MobileScreen {
  final BuildContext context;

  MobileScreen({required this.context});

  double get width {
    return MediaQuery.of(context).size.width;
  }

  double get height {
    return MediaQuery.of(context).size.height;
  }
}
