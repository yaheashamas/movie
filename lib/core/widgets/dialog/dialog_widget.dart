import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movies/config/common/constants/size_constants.dart';
import 'package:movies/config/common/extensions/string_extensions.dart';
import 'package:movies/config/theme/theme_color.dart';
import 'package:movies/core/widgets/global/button_widget.dart';

class DialogWidget extends StatelessWidget {
  final String title, description, buttonText;
  final String? image;

  const DialogWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonText,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.vulcan,
      elevation: Sizes.dimen_32,
      insetPadding: EdgeInsets.all(Sizes.dimen_32.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.dimen_8.w),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_16.w,
          vertical: Sizes.dimen_8.h,
        ),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColor.vulcan,
              blurRadius: Sizes.dimen_16,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title.t(context),
              style: Theme.of(context).textTheme.headline5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Sizes.dimen_6.h),
              child: Text(
                description.t(context),
                textAlign: TextAlign.center,
              ),
            ),
            if (image != null)
              Padding(
                padding: EdgeInsets.all(Sizes.dimen_6.h),
                child: Image.asset(
                  image!,
                ),
              ),
            ButtonWidget(
              text: buttonText,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
