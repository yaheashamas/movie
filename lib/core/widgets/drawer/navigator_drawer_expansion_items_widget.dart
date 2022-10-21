import 'package:flutter/material.dart';
import 'package:movies/config/common/constants/size_constants.dart';
import 'package:movies/core/widgets/drawer/navigator_drawer_item_widget.dart';

class NavigatorDrawerExpansionItemsWidget extends StatelessWidget {
  final String title;
  final Function(int index) onTap;
  final List<String> items;

  const NavigatorDrawerExpansionItemsWidget({
    Key? key,
    required this.title,
    required this.onTap,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
          )
        ],
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        children: [
          for (var i = 0; i < items.length; i++)
            NavigatorDrawerItemWidget(
              paddingLeft: Sizes.dimen_16,
              title: items[i],
              onTap: () => onTap(i),
            )
        ],
      ),
    );
  }
}
