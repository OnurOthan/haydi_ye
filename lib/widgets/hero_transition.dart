import 'package:flutter/material.dart';

class HeroTransition extends StatelessWidget {
  final Widget child;
  final String tag;

  const HeroTransition({required this.child, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Material(
        color: Colors.transparent,
        child: child,
      ),
    );
  }
}