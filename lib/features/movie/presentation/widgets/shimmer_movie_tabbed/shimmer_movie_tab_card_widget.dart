import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/config/common/constants/size_constants.dart';
import 'package:movies/core/widgets/shimmer/shimmer_widget.dart';

class ShimmerMovieTabCardWidget extends StatelessWidget {
  const ShimmerMovieTabCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
            child: ShimmerWidget.rectanguler(
              height: Sizes.dimen_40.h,
              widget: Sizes.dimen_40.w,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: Sizes.dimen_4.h,
          ),
          child: const ShimmerWidget.rectanguler(height: 10),
        )
      ],
    );
  }
}
