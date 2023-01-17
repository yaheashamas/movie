import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/config/common/constants/route_constants.dart';
import 'package:movies/config/common/constants/size_constants.dart';
import 'package:movies/config/common/constants/languages.dart';
import 'package:movies/config/common/constants/translation_constants.dart';
import 'package:movies/config/common/extensions/string_extensions.dart';
import 'package:movies/core/widgets/dialog/dialog_widget.dart';
import 'package:movies/core/widgets/drawer/navigator_drawer_expansion_items_widget.dart';
import 'package:movies/core/widgets/drawer/navigator_drawer_item_widget.dart';
import 'package:movies/features/movie/presentation/widgets/logo_widget.dart';
import 'package:wiredash/wiredash.dart';

import '../../../features/movie/presentation/bloc/language/language_cubit.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.dimen_300.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: Sizes.dimen_18.h,
                left: Sizes.dimen_8.w,
                right: Sizes.dimen_8.w,
                top: Sizes.dimen_60.h,
              ),
              child: LogoWidget(
                height: Sizes.dimen_60.h,
              ),
            ),
            NavigatorDrawerItemWidget(
              title: TranslationConstants.favoriteMovies.t(context),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(RouteList.favorite);
              },
            ),
            NavigatorDrawerExpansionItemsWidget(
              title: TranslationConstants.language.t(context),
              items: Languages.languages.map((e) => e.value).toList(),
              onTap: (index) {
                BlocProvider.of<LanguageCubit>(context)
                    .updateLanguage(Languages.languages[index]);
              },
            ),
            NavigatorDrawerItemWidget(
              title: TranslationConstants.feedback.t(context),
              onTap: () {
                Navigator.of(context).pop();
                Wiredash.of(context).show(inheritMaterialTheme: true);
              },
            ),
            NavigatorDrawerItemWidget(
              title: TranslationConstants.about.t(context),
              onTap: () {
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (context) => const DialogWidget(
                    title: TranslationConstants.about,
                    description: TranslationConstants.aboutDescription,
                    image: "assets/pngs/tmdb_logo.png",
                    buttonText: TranslationConstants.okay,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
