import 'package:flutter/material.dart';

class MovieDetailAppBarWidget extends StatelessWidget {
  const MovieDetailAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
          TextButton(
            onPressed: () {},
            child: const Icon(Icons.favorite_border, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
