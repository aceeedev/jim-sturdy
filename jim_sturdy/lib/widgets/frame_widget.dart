import 'package:flutter/material.dart';

class Frame extends StatelessWidget {
  Frame({super.key, required this.child});

  Widget child;

  @override
  Widget build(BuildContext context) => SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: child,
      ));
}
