// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movies/config/theme/theme_color.dart';
import 'package:wiredash/wiredash.dart';

class WireDashApp extends StatelessWidget {
  final navigatorKey;
  final Widget child;
  final Locale locale;

  const WireDashApp({
    Key? key,
    required this.navigatorKey,
    required this.locale,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'movie-l2g5cjh',
      secret: 'CuDOB9dBkflk2DjimeTPG5UGJp8SYDc_',
      navigatorKey: navigatorKey,
      options: WiredashOptionsData(
        locale: locale,
      ),
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColor.royalBlue,
        secondaryColor: AppColor.violet,
        secondaryBackgroundColor: AppColor.vulcan,
      ),
      child: child,
    );
  }
}
