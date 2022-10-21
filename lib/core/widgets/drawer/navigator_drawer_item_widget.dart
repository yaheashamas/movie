import 'package:flutter/material.dart';

class NavigatorDrawerItemWidget extends StatelessWidget {
  final String title;
  final double paddingLeft;
  final Function()? onTap;

  const NavigatorDrawerItemWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.paddingLeft = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddingLeft),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.7),
              )
            ],
          ),
          child: ListTile(
            title: Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
      ),
    );
  }
}
