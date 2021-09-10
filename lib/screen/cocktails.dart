import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class CockTailsPage extends StatefulWidget {
  const CockTailsPage({Key? key}) : super(key: key);

  @override
  _CockTailsPageState createState() => _CockTailsPageState();
}

class _CockTailsPageState extends State<CockTailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodySection(),
    );
  }
  bodySection(){
    return Container(
        decoration: BoxDecoration(
          color: Color(0xff003366),
          backgroundBlendMode: BlendMode.srcOver,
        ),
        child: PlasmaRenderer(
            type: PlasmaType.infinity,
            particles: 10,
            color: Color(0x44e45a23),
            blur: 0.4,
            size: 1,
            speed: 1,
            offset: 0,
            blendMode: BlendMode.plus,
            particleType: ParticleType.atlas,
            variation1: 0,
            variation2: 0,
            variation3: 0,
            rotation: 0,
            child: Container()));
  }
}
