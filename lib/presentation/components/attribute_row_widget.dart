import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AttributeRowWidget extends StatelessWidget {
  const AttributeRowWidget({
    super.key,
    required this.attribute,
    required this.value,
  });

  final String attribute;
  final int value;
  final double starSize = 25.0;

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          attribute,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            if (index < value.floor()) {
              return Icon(isIOS ? CupertinoIcons.star_fill : Icons.star,
                  color: Colors.amber, size: starSize);
            } else if (index < value && value - index >= 0.5) {
              return Icon(
                  isIOS ? CupertinoIcons.star_lefthalf_fill : Icons.star_half,
                  color: Colors.amber,
                  size: starSize);
            } else {
              return Icon(isIOS ? CupertinoIcons.star : Icons.star_border,
                  color: Colors.amber, size: starSize);
            }
          }),
        ),
      ],
    );
  }
}
