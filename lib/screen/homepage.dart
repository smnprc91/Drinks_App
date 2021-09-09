import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class _HomePageState extends State<HomePage> {
  var colorebello = false;
  var zio = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(),
      body: buildBodyStyle(),
    );
  }






















  buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
        centerTitle: true,
     title: 
     
 Container(
   height: 60,
   width: 60,
      decoration: new BoxDecoration(
               color: Colors.transparent.withOpacity(0.4),
              borderRadius: new BorderRadius.all(Radius.circular(20))
               
              
            ),
   
   alignment: Alignment.center,
   child: IconButton(
            icon: const Icon(Icons.person,color: Colors.amber,size: 30,),
          
            onPressed: () {
           
            },
          ),
 ),
      
    );
  }

  buildBodyStyle() {
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
            child: bodyMainContent()));
  }

  bodyMainContent() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          primaSezioneBody(),
         secondaSezioneBody(),
        ],
      ),
    );
  }

  primaSezioneBody() {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          height: 300,
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: Center(
              child: Text(
            'doooooooooooooooooooooooooooooooooooggy',
            style: TextStyle(fontSize: 40),
          )),
        ),
      ),
    );
  }

  secondaSezioneBody() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          print('hai cliccato giu');
        },
        child: Container(
            color: Colors.transparent,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: false,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imgList
                  .map((item) => Stack(children: [
                        Center(
                            child: Image.network(item,
                                fit: BoxFit.cover, width: 1000)),
                        Positioned(
                            bottom: 40,
                            left: 50,
                            right: 0,
                            child: Text(
                              'nome categorie ',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ))
                      ]))
                  .toList(),
            )),
      ),
    );
  }
}





/*class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

Size displaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  return displaySize(context).width;
}

class _HomePageState extends State<HomePage> {
  List _categorie = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/test.json');
    final data = await json.decode(response);
    setState(() {
      _categorie = data["categorie"];
    });
  }

  @override
  void initState() {
  
    readJson();
    super.initState();
  }

  var _color = Colors.amberAccent;
  double _height = 100;
  var _color2 = Colors.amberAccent;
  double _height2 = 0;
  var _color3 = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: listview()),
          ],
        ),
      ),
    );
  }

  listview() {
    return ListView.builder(
      itemCount: _categorie.length,
      itemBuilder: (context, index) {
        return listtile(index);
      },
    );
  }

  listtile(index) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            print('object');
            setState(() {
              _color = Colors.greenAccent;
              _height = displayHeight(context) * 0.2;
              _color2 = Colors.greenAccent;
              _height2 = displayHeight(context) * 0.2;
              _color3 = Colors.black;
            });
          },
          child: AnimatedContainer(
              height: _height,
              width: displayWidth(context),
              decoration: BoxDecoration(
                color: _color,
              ),
              duration: const Duration(seconds: 1),
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text('qui va passata l immagine')),
        ),
        AnimatedContainer(
          width: displayWidth(context),
          height: _height2,
          decoration: BoxDecoration(
            color: _color2,
          ),
          duration: const Duration(seconds: 1),
          margin: EdgeInsets.only(left: 10, right: 10),
          child: ListTile(
    
            title: Text(_categorie[index]["name"]),
           
          ),
        ),
        AnimatedContainer(
            width: displayWidth(context),
            height: _height2,
            decoration: BoxDecoration(
              color: _color2,
            ),
            duration: const Duration(seconds: 1),
            margin: EdgeInsets.only(left: 10, right: 10),
            child: IconButton(
                icon: Icon(
                  Icons.arrow_upward,
                  color: _color3,
                ),
                onPressed: () {
                  setState(() {
                    _color = Colors.amberAccent;
                    _height = 100;
                    _color2 = Colors.amberAccent;
                    _height2 = 0;
                    _color3 = Colors.transparent;
                  });
                })),
      ],
    );
  }
}
 */