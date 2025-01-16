import 'package:flutter/material.dart';

class ShakeTransition extends StatelessWidget {
  final Widget child;
  final AnimationController controller;

  const ShakeTransition(
      {super.key, required this.child, required this.controller});

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = Tween(begin: -10.0, end: 10.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(controller);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(animation.value, 0.0),
          child: child,
        );
      },
      child: child,
    );
  }
}
