import 'package:flutter/material.dart';
import 'package:progdrinks/Models/categoria.dart';
import 'package:progdrinks/bloc/block.dart';
import 'package:simple_animations/simple_animations.dart';

class DoW extends StatefulWidget {
  const DoW({Key? key}) : super(key: key);

  @override
  _DoWState createState() => _DoWState();
}

class _DoWState extends State<DoW> {
  final Bloc bloc = new Bloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xff000029),
            backgroundBlendMode: BlendMode.srcOver,
          ),
          child: PlasmaRenderer(
              type: PlasmaType.infinity,
              particles: 10,
              color: Color(0x44e45a23),
              blur: 0.4,
              size: 0.30,
              speed: 2,
              offset: 0,
              blendMode: BlendMode.plus,
              particleType: ParticleType.atlas,
              variation1: 0,
              variation2: 0,
              variation3: 0,
              rotation: 0,
              child: StreamBuilder(
                  stream: bloc.streamCategoria,
                  builder: (context, risultatoDelloStream) {
                    if (risultatoDelloStream.hasData) {
                      List<Categoria>? categorie =
                          risultatoDelloStream.data as List<Categoria>?;
                      // ignore: unused_local_variable
                      var drinks = categorie!
                          .map((Categoria c) => c.drinks)
                          .toList()
                          .expand((e) => e)
                          .toList();
                      return Container();
                    } else {
                      return Container();
                    }
                  }))),
    );
  }
}
