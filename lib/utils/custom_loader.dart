import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constant/app_colors.dart';

class CustomLoader extends StatelessWidget {
  final double size;

  CustomLoader({
    Key? key,
    this.size = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCircle(
        color: AppColors.primary,
        size: size,
      ),
    );
  }
}
