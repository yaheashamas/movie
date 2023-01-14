// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movies/config/common/constants/size_constants.dart';
import 'package:movies/config/common/constants/translation_constants.dart';
import 'package:movies/config/common/extensions/string_extensions.dart';

import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/core/widgets/global/button_widget.dart';
import 'package:wiredash/wiredash.dart';

class AppErrorWidget extends StatelessWidget {
  final FailureType failureType;
  final void Function()? onPressedRetry;

  const AppErrorWidget({
    Key? key,
    required this.failureType,
    required this.onPressedRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.dimen_32),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            failureType == FailureType.api
                ? TranslationConstants.somethingWentWrong.t(context)
                : TranslationConstants.checkNetwork.t(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonWidget(
                text: TranslationConstants.retry,
                onPressed: onPressedRetry!,
              ),
              ButtonWidget(
                text: TranslationConstants.feedback,
                onPressed: () => Wiredash.of(context).show(
                  inheritMaterialTheme: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
