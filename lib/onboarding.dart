import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_train/data.dart';
import 'package:flutter_application_train/gen/assets.gen.dart';
import 'package:flutter_application_train/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingScreen extends StatefulWidget{

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  final PageController _pageController = PageController();
  final items = AppDatabase.onBoardingItem;
  int page=0;
  @override
  void initState() {
    _pageController.addListener(() {
      if(_pageController.page!.round()!=page){
        setState(() {
          page = _pageController.page!.round();
        });
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(child: Assets.img.background.onboard.image(fit: BoxFit.cover)),
            Positioned(child:  Center(child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.youtube.svg(width: 100,height: 100,color: Colors.blue),
            const SizedBox(height: 8,),
            Text('PAPILOO', style: Theme.of(context).textTheme.headline4!.apply(color: Colors.blue),)
          ],
        ) ,),),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                height: 260,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:const BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1)
                    )
                  ]
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        itemCount: items.length,
                        controller: _pageController,
                        itemBuilder: ((context, index) {
                          final item = items[index];
                          return Padding(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(item.title,style: Theme.of(context).textTheme.headline4,),
                                const SizedBox(height: 16,),
                                Text(item.description,style: Theme.of(context).textTheme.subtitle1!.apply(fontSizeFactor: 0.9),)
                              ],
                            ),
                          );
                        }))),
                    Container(
                      height: 60,
                      padding: const EdgeInsets.fromLTRB(32, 0, 32, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmoothPageIndicator(
                            controller: _pageController, 
                            effect:  ExpandingDotsEffect(
                              activeDotColor: Colors.blue,
                              dotHeight: 8,
                              dotWidth: 8,
                              dotColor: Colors.blue.withOpacity(0.1) ),
                            count: items.length),
                          ElevatedButton(
                            onPressed: (() {
                              if(page==items.length-1){
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context)=>  HomeScreen())
                                );
                              }else{
                                _pageController.animateToPage(page+1, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
                              }
                            }), 
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(const Size(84, 60)),
                              backgroundColor: MaterialStateProperty.all(Colors.blue),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)
                                )
                              )
                            ),
                            child:  Icon(page == items.length-1?CupertinoIcons.check_mark:CupertinoIcons.arrow_right)),
                            
                        ],
                      ),
                    )
                  ],
                ),
              ) )
          ]),
      ),
    );
  }
}