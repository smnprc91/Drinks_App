import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

// ignore: must_be_immutable
class MyBodyStyle extends StatefulWidget {
  const MyBodyStyle({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  _MyBodyStyleState createState() => _MyBodyStyleState();
}

class _MyBodyStyleState extends State<MyBodyStyle> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xff000029),
          backgroundBlendMode: BlendMode.srcOver,
        ),
        child: PlasmaRenderer(
            type: PlasmaType.infinity,
            particles: 10,
            color: Color(0x44e45a23),
            blur: 0.2,
            size: 0.30,
            speed: 2,
            offset: 0,
            blendMode: BlendMode.plus,
            particleType: ParticleType.atlas,
            variation1: 0,
            variation2: 0,
            variation3: 0,
            rotation: 0,
            child: widget.child));
  }
}
