import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:progdrinks/screen/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstStartingPage extends StatefulWidget {
  const FirstStartingPage({Key? key, }) : super(key: key);
  

  @override
  _FirstStartingPageState createState() => _FirstStartingPageState();
}

class _FirstStartingPageState extends State<FirstStartingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    _storeOnboardInfo();
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (BuildContext context) => HomePage(
              
              )),
    );
  }

  _storeOnboardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    const primarycolotr = Color(0xff212529);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 25.0, fontWeight: FontWeight.w700, color: Colors.amber),
      titlePadding: EdgeInsets.only(top: 50),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
      pageColor: primarycolotr,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: primarycolotr,
      globalHeader: Align(
        alignment: Alignment.topRight,
      ),

      pages: [
        PageViewModel(
          title: 'Benvenuto su DrinkIt',
          bodyWidget: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Image.asset('assets/fondo.jpg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Container(),
                ),
                Text(
                  'DrinkIt è un progetto indipendente,',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Aiutaci a crescere!',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "La responsabilità prima di  tutto.",
          bodyWidget: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Image.asset('assets/dont.jpg')),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text(
                    'SE BEVI NON GUIDARE',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text(
        'Salta',
        style: TextStyle(color: primarycolotr),
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: primarycolotr,
      ),
      done: const Text('Finito',
          style: TextStyle(fontWeight: FontWeight.w600, color: primarycolotr)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: primarycolotr,
        activeSize: Size(22.0, 10.0),
        activeColor: Colors.amber,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Color(0xffb4c4c4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
