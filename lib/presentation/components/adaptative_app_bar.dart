import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AdaptativeAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Theme.of(context).colorScheme.inversePrimary;
    final bool isIos = Theme.of(context).platform == TargetPlatform.iOS;

    if (isIos) {
      return CupertinoNavigationBar(
        middle: Text(title),
        backgroundColor: backgroundColor,
      );
    }
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
