import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoWidget extends StatelessWidget {
  final double height;

  const LogoWidget({Key? key, required this.height})
      : assert(height != null, "hight must not be null"),
        assert(height > 0, "height must be greater than zero"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/pngs/logo.png",
      color: Colors.white,
      height: height.h,
      width: double.infinity,
    );
  }
}
