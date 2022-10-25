import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/config/common/constants/size_constants.dart';
import 'package:movies/features/movie/presentation/widgets/shimmer_movie_tabbed/shimmer_movie_tab_card_widget.dart';

class ShimmerListViewBuilderWidget extends StatelessWidget {
  const ShimmerListViewBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Sizes.dimen_6.h),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(width: 14.w);
        },
        itemBuilder: (context, index) {
          return const ShimmerMovieTabCardWidget();
        },
      ),
    );
  }
}
