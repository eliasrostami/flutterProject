import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_train/article.dart';
import 'package:flutter_application_train/auth.dart';
import 'package:flutter_application_train/gen/fonts.gen.dart';
import 'package:flutter_application_train/home.dart';
import 'package:flutter_application_train/profile.dart';
import 'package:flutter_application_train/splash.dart';
import 'package:flutter_application_train/test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';




void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(

    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark

  ));
  runApp( MyApp());
}

class MyApp extends StatefulWidget{

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;
  Locale _locale = Locale('en');
  // Locale _locale = Locale('en');
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Paoiloo',
       localizationsDelegates:const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      theme: MyAppThemeConfig.light().getTheme(_locale.languageCode),
      // theme: themeMode == ThemeMode.dark? MyAppThemeConfig.dark().getTheme(_locale.languageCode):MyAppThemeConfig.light().getTheme(_locale.languageCode),

      home:  MainScreen()
      // Stack(
      //   children: [
      //     Positioned.fill(child: HomeScreen()),
      //     Positioned(bottom: 0, right: 0, left: 0, child: _BottomNavigation())
      //   ],
      // ),
      // home: HomePage(toggleThemMode:(){
      //   setState(() {
      //     themeMode == ThemeMode.dark? themeMode = ThemeMode.light: themeMode = ThemeMode.dark;
      //   });
      // },
      // toggleLanguage: (Language newlanguage) {
      //   setState(() {
      //     _locale = newlanguage == Language.en?Locale('en'):Locale('fa');
      //   });
        
      // }, ),
    );
  }
}

class MyAppThemeConfig{

  
  
  final Color primaryColor = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color backgroundColor;
  final Color surfaceColor;
  final Color appBarColor;
  final Color captionColor;
  final Brightness brightness;

  MyAppThemeConfig.dark():
    primaryTextColor = Colors.white,
    secondaryTextColor = Colors.white70,
    backgroundColor = const Color.fromARGB(255, 30, 30, 30),
    captionColor = const Color(0xff7B8BB2),
    surfaceColor = const Color(0x0dffffff),
    appBarColor = Colors.black,
    brightness = Brightness.dark;

  MyAppThemeConfig.light():
    primaryTextColor = Colors.grey.shade900,
    secondaryTextColor = Colors.grey.shade900.withOpacity(0.8),
    backgroundColor = Colors.white,
    captionColor = const Color(0xff7B8BB2),
    surfaceColor = const Color(0x0d000000),
    appBarColor = Colors.white,
    brightness = Brightness.light;

  ThemeData getTheme(String language)  {
    return ThemeData(
      primarySwatch: Colors.pink,
      primaryColor: primaryColor,
      dividerColor: surfaceColor,
      brightness: brightness,
      scaffoldBackgroundColor: backgroundColor,
      textButtonTheme: TextButtonThemeData(style: ButtonStyle(textStyle: MaterialStateProperty.all(const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      )))),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceColor,
        labelStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none
        )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(primaryColor))
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        titleSpacing: 32,
        backgroundColor: appBarColor,
        foregroundColor: primaryTextColor
      ),
      dividerTheme: DividerThemeData(color: primaryColor,thickness: 1,endIndent: 10,indent: 10),
      textTheme:language == Language.en? enPrimaryTextTheme:faPrimaryTextTheme,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: primaryColor,
        
      )
    );
  }

  TextTheme get enPrimaryTextTheme => GoogleFonts.latoTextTheme(TextTheme(
    bodyText1: TextStyle(fontSize: 13, color: primaryTextColor),
    bodyText2: TextStyle(fontSize: 15, color: secondaryTextColor),
    subtitle1: TextStyle(fontSize: 16, color: secondaryTextColor, fontWeight: FontWeight.bold),
    subtitle2: TextStyle(fontSize: 14, color: primaryTextColor, fontWeight: FontWeight.w400),
    headline6: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryTextColor),
    headline5: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: primaryTextColor,fontFamily: FontFamily.avenir),
    headline4: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: primaryTextColor, fontFamily: FontFamily.avenir),
    caption:   TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: captionColor, fontFamily: FontFamily.avenir)
  ));

  TextTheme get faPrimaryTextTheme => TextTheme(
    bodyText1: TextStyle(fontSize: 13, color: primaryTextColor,fontFamily: FontFamily.iranYekan,height: 1.5),
    bodyText2: TextStyle(fontSize: 15, color: secondaryTextColor, fontFamily: FontFamily.iranYekan, height: 1.5),
    subtitle1: TextStyle(fontSize: 16, color: primaryTextColor, fontWeight: FontWeight.bold, fontFamily: FontFamily.iranYekan),
    headline6: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryTextColor, fontFamily: FontFamily.iranYekan),
    caption: const TextStyle(fontFamily: FontFamily.iranYekan),
    button: const TextStyle(fontFamily: FontFamily.iranYekan),
  );
}

class MainScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      bottomNavigationBar: _BottomNavigation(),
      body: HomeScreen(),
    );
  }
}

class HomePage extends StatefulWidget{

  Function() toggleThemMode;
  Function(Language language) toggleLanguage;
  

  HomePage({required this.toggleThemMode, required this.toggleLanguage});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  ThemeMode _themeMode = ThemeMode.dark;
  Language _language = Language.en;
  SkillType _skillType = SkillType.photoshop;

  void changeThemeMode(ThemeMode themeMode){
    widget.toggleThemMode();
    setState(() {
      _themeMode = themeMode;
    });
  }

  void updateLanguage(Language language){
    widget.toggleLanguage(language);
    setState(() {
      this._language = language;
    });
  }

  void updateSelectedSkill(SkillType skillType){
    setState(() {
      this._skillType = skillType;
    });
  }

  @override
  Widget build(BuildContext context) {

    final localization = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.profileTitle),
        actions: const [
          Icon(CupertinoIcons.chat_bubble),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: Icon(CupertinoIcons.ellipsis_vertical),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset('assets/images/profile_image.png',width: 60,height: 60,),
                  ),
                  const SizedBox(width: 12,),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(localization.name,style: textTheme.subtitle1,),
                      Text(localization.job,style: textTheme.bodyText1,),
                      Row(
                        children: [
                          Icon(CupertinoIcons.location,size: 16,color: textTheme.bodyText2!.color,),
                          const SizedBox(width: 4,),
                          Text(localization.location,style: textTheme.caption,)
                        ],
                      )
                    ],
                  )),
                  Icon(CupertinoIcons.heart,color: Theme.of(context).primaryColor,)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: Text(localization.summary),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(localization.mode),
                  CupertinoSlidingSegmentedControl<ThemeMode>(
                    thumbColor: Theme.of(context).colorScheme.primary,
                    groupValue: _themeMode,                    
                    children: {
                        ThemeMode.dark: Text(
                          localization.darkMode,
                          style: TextStyle(fontSize: 14),
                        ),
                        ThemeMode.light: Text(
                          localization.lightMode,
                          style: TextStyle(fontSize: 14),
                        )
                      },
                    onValueChanged: (value) {
                       if(value != null) changeThemeMode(value);
                      })  
                ],

              ),
            ),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(localization.selectedLanguage),
                   CupertinoSlidingSegmentedControl<Language>(
                    thumbColor: Theme.of(context).colorScheme.primary,
                      groupValue: _language,
                      children: {
                        Language.en: Text(
                          localization.enLanguage,
                          style: TextStyle(fontSize: 14),
                        ),
                        Language.fa: Text(
                          localization.faLanguage,
                          style: TextStyle(fontSize: 14),
                        )
                      },
                      onValueChanged: (value) {
                        if (value != null) updateLanguage(value);
                      })
                ],

              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(localization.skills,style: textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold),),
                  const SizedBox(width: 2,),
                  const Icon(CupertinoIcons.chevron_down,size: 12,)
                ],
              ),
            ),
            Center(
              child: Wrap(
                direction: Axis.horizontal,
                runSpacing: 20,
                spacing: 20,
                children: [
                  Skill(title: 'photoshop',imagePth: 'assets/images/app_icon_01.png',shadowColor: Colors.blue,isActive: _skillType == SkillType.photoshop,onTap:() =>  updateSelectedSkill(SkillType.photoshop)  ,type: SkillType.photoshop,),
                  Skill(title: 'Lightroom',imagePth: 'assets/images/app_icon_02.png',shadowColor: Colors.blue,isActive: _skillType == SkillType.lightRoom,onTap: () =>  updateSelectedSkill(SkillType.lightRoom) ,type: SkillType.lightRoom,),
                  Skill(title: 'After Effect',imagePth: 'assets/images/app_icon_03.png',shadowColor: Colors.blue.shade800,isActive: _skillType == SkillType.afterEffect,onTap: () =>  updateSelectedSkill(SkillType.afterEffect) ,type: SkillType.afterEffect,),
                  Skill(title: 'ilustrator',imagePth: 'assets/images/app_icon_04.png',shadowColor: Colors.orange.shade100,isActive: _skillType == SkillType.ilustrator,onTap: () =>  updateSelectedSkill(SkillType.ilustrator) ,type: SkillType.ilustrator,),
                  Skill(title: 'Adob XD',imagePth: 'assets/images/app_icon_05.png',shadowColor: Colors.pink,isActive: _skillType == SkillType.xd,onTap: () =>  updateSelectedSkill(SkillType.xd) ,type: SkillType.xd,),
                  
                ],

              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(localization.personalInformation,style: textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 2,),
                  const Icon(CupertinoIcons.chevron_down,size: 12,)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                    labelText: localization.email,
                    prefixIcon: const Icon(CupertinoIcons.at)
                    ),
                  ),
                  const SizedBox(height: 8,),
                  TextField(
                     decoration: InputDecoration(
                     labelText: localization.password,
                     prefixIcon: const Icon(CupertinoIcons.lock)
                     )
                  ),
                  const SizedBox(height: 12,),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(onPressed: (){}, child: Text(localization.save)))
                ],
              ),
            )
            
          ],
        )
         ),
    );
  }
}

class Skill extends StatelessWidget {

  final SkillType type;
  final String title;
  final String imagePth;
  final Color shadowColor;
  final bool isActive;
  final Function() onTap;
  const Skill({
    Key? key,
    required this.type,
    required this.title,
    required this.imagePth,
    required this.shadowColor,
    required this.isActive,
    required this.onTap
    
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: 110,
        height: 110,
        decoration:isActive? BoxDecoration(
          color: Theme.of(context).dividerColor,
          borderRadius: BorderRadius.circular(12)
        ):null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration:isActive? BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: shadowColor,blurRadius: 20                                
                  )
                ]
              ):null,
              child: Image.asset(imagePth,width: 40,height: 40,)),
            const SizedBox(height: 8,),
             Text(title)
          ],
        ),
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    
    return Container(
      
      height: 85,

      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Color(0xff9b8487).withOpacity(0.3)
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _BottomNavigationItem(title: 'Home', iconFileName: 'Home.png', activeIconFileName: 'Home.png'),
                  _BottomNavigationItem(title: 'Articles', iconFileName: 'Articles.png', activeIconFileName: 'Articles.png'),
                  const SizedBox(width: 8,),
                  _BottomNavigationItem(title: 'Search', iconFileName: 'Search.png', activeIconFileName: 'Search.png'),
                  _BottomNavigationItem(title: 'Menu', iconFileName: 'Menu.png', activeIconFileName: 'Menu.png'),
                ],
              ),
            )),
            Center(
              child: Container(
                width: 65,
                height: 85,
                alignment: Alignment.topCenter,
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                    color: const Color(0xff376AED),
                    borderRadius: BorderRadius.circular(32.5),
                    border: Border.all(color: Colors.white, width: 4)
                  ),
                  child: Image.asset('assets/img/icons/plus.png'),
                ),
              ),
            )
        ],
      ),

      

    );
  }
}

class _BottomNavigationItem extends StatelessWidget{

  final String title;
  final String iconFileName;
  final String activeIconFileName;

  _BottomNavigationItem({

    Key? key,
    required this.title,
    required this.iconFileName,
    required this.activeIconFileName

  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Image.asset('assets/img/icons/$iconFileName'),
        const SizedBox(width: 4,),
        Text(title,style: Theme.of(context).textTheme.caption,)

      ],
    );
  }

}

enum Language{
  en, fa
}

enum SkillType {
  photoshop,
  xd,
  ilustrator,
  afterEffect,
  lightRoom,
}
