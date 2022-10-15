import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/config/common/constants/size_constants.dart';
import 'package:movies/features/movie/presentation/widgets/logo_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().statusBarHeight + Sizes.dimen_4.h,
        left: Sizes.dimen_16.w,
        right: Sizes.dimen_16.w,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/svgs/menu.svg',
              height: Sizes.dimen_12.h,
            ),
          ),
          const Expanded(
            child: LogoWidget(
              height: Sizes.dimen_14,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: Sizes.dimen_12.h,
            ),
          ),
        ],
      ),
    );
  }
}
