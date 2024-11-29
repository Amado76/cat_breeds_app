import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveSearchField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String placeholder;
  final TextEditingController? controller;

  const AdaptiveSearchField({
    super.key,
    required this.onChanged,
    this.placeholder = 'Search...',
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    if (isIOS) {
      return CupertinoSearchTextField(
        controller: controller,
        placeholder: placeholder,
        onChanged: onChanged,
      );
    }

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: placeholder,
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
