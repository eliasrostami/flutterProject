
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_train/gen/assets.gen.dart';
import 'package:flutter_application_train/onboarding.dart';
import 'package:flutter_application_train/test.dart';

class SplashScreen extends StatefulWidget{

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    
    Future.delayed(const Duration(seconds: 2)).then((value) {

        Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: ((context) => Elias())));
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(child: Assets.img.background.onboard.image(fit: BoxFit.cover)),
        Center(child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.youtube.svg(width: 100,height: 100,color: Colors.blue),
            const SizedBox(height: 8,),
            Text('PAPILOO', style: Theme.of(context).textTheme.headline4!.apply(color: Colors.blue),)
          ],
        ) ,),
      ]),
    );
  }
}