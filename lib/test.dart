
import 'dart:html';
import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_train/carousel/carousel_slider.dart';
import 'package:flutter_application_train/data.dart';
import 'package:flutter_application_train/gen/assets.gen.dart';
import 'package:flutter_application_train/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Elias extends StatelessWidget{
   
   @override
  Widget build(BuildContext context) {
    
    // return Stack(
    //   children: [
    //     Positioned.fill(child: TestScreen()),
    //     Positioned(right: 0, left: 0, bottom: 0 ,child: _BottomNavigation())
    //   ],
    // );

    return Article();
  }
}

class TestScreen extends StatelessWidget {

  final stories = AppDatabase.stories;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Hi Elias',style: textTheme.subtitle1,),
                    // Image.asset('assets/img/icons/notification.png',width: 24,height: 24,)
                    Assets.img.icons.notification.image(width: 34,height: 34),
                    
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                child: Text('Explore Today`s',style: textTheme.headline4,),
              ),
              _StoryList(stories: stories, textTheme: textTheme),
              _CategoryList(),
              _PostList()
            ],
          ),
        ),
      ),
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    Key? key,
    required this.stories,
    required this.textTheme,
  }) : super(key: key);

  final List<Story> stories;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width:  MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: stories.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(32, 4, 32, 0),
        itemBuilder: ((context, index) {
          final story = stories[index];
          return _Story(story: story, textTheme: textTheme);
          
        })),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    Key? key,
    required this.story,
    required this.textTheme,
  }) : super(key: key);

  final Story story;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child:story.isViewed?profileImageViewed(): profileImageNormal(),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset('assets/img/icons/${story.iconFileName}',width: 24,height: 24,))  
          ],
        ),
        const SizedBox(height: 8,),
        Text(story.name, style: textTheme.bodyText1,)
      ],
    );
  }

  Widget profileImageNormal() {
    return Container(
              width: 68,
              height: 68,
               decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient:const LinearGradient(
                    begin: Alignment.topLeft,
                    colors:[
                      Color(0xff376AED),
                      Color(0xff49B0E2),
                      Color(0xff9CECFB),
                    ] )
                ),
              child: Container(
               margin: const EdgeInsets.all(2),
               decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
               ),
               padding: const EdgeInsets.all(5),
               child: imageProfile(),
              ),
            );
  }

  Widget profileImageViewed() {
    return SizedBox(
              width: 68,
              height: 68,
              child: DottedBorder(
               borderType: BorderType.RRect,
               strokeWidth: 2,
               dashPattern: [8,3],
               color: const Color(0xff7B8BB2),
               radius: const Radius.circular(24),
               padding: const EdgeInsets.all(7),
               child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24)
                ),
                child: imageProfile()),
              ),
            );
  }

  Widget imageProfile() {
    return ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: Image.asset('assets/img/stories/${story.imageFileName}'),
               );
  }
}

class _CategoryList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return CarouselSlider.builder(
      itemCount: categories.length, 
      itemBuilder: ((context, index, realIndex) {
        final category = categories[realIndex];
        final double left = realIndex==0?32:8;
        final double right = realIndex==categories.length-1?32:8;
        
       return  _CategoryItem(left: left, right: right, category: category);
      }), 
      options: CarouselOptions(
        initialPage: 0,
        aspectRatio: 1.2,
        disableCenter: true,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        scrollDirection: Axis.horizontal,
        scrollPhysics: const BouncingScrollPhysics(),
        enlargeStrategy: CenterPageEnlargeStrategy.height        
      ));
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    Key? key,
    required this.left,
    required this.right,
    required this.category,
  }) : super(key: key);

  final double left;
  final double right;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 8, right, 0),
      child: Stack(
         children: [
           Positioned.fill(
             top: 100,
             left: 65,
             right: 65,
             bottom: 24,
             child: Container(
               decoration: const BoxDecoration(
                 boxShadow: [BoxShadow(
                   blurRadius: 20,
                   color: Color(0xaa0D253C)
                 )]
               ),
             ),
           ),
           Positioned.fill(
             child: Container(
                 margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                 decoration: BoxDecoration(
                 color: Colors.blue,
                 borderRadius: BorderRadius.circular(32) ),
                 foregroundDecoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(32),
                   gradient: const LinearGradient(
                     begin: Alignment.bottomCenter,
                     end: Alignment.center,
                     colors: [
                       Color(0xff0D253C),
                       Colors.transparent
                     ]
                   )
                 ),
                 child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Image.asset('img/posts/large/${category.imageFileName}',fit: BoxFit.fill,),)
           )),
           Positioned(
             bottom: 48,
             left: 32,
             child: Text(category.title,
               style: Theme.of(context).textTheme.headline6!.apply(color: Colors.white),))
         ]),
    );
  }
}

class _PostList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final posts= AppDatabase.posts;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Latest News', style: Theme.of(context).textTheme.headline5,),
              TextButton(onPressed: () {}, child: const Text('More', style: TextStyle(color: Color(0xff376AED)),),),
            ],
          ),),
          ListView.builder(
            itemCount: posts.length,
            shrinkWrap: true,
            itemExtent: 143,
            physics: const ClampingScrollPhysics(),
            itemBuilder: ((context, index) {
              final post= posts[index];
              return _Post(post: post);
            }))
      ],
    );
  }
}

class _Post extends StatelessWidget{
  final Post post;

  const _Post({super.key, required this.post});
  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Color(0x1a5282FF)
          )
        ]
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset('img/posts/small/${post.imageFileName}')),
            const SizedBox(width: 16,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.caption, style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Color(0xff376AED))),
                    const SizedBox(height: 8,),
                    Text(post.title,style: Theme.of(context).textTheme.subtitle2,),
                    const SizedBox(height: 16,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.hand_thumbsup,size: 16,color: Theme.of(context).textTheme.bodyText2!.color,),
                        const SizedBox(width: 8,),
                        Text(post.likes,style: Theme.of(context).textTheme.bodyText2,),
                        const SizedBox(width: 16,),
                        Icon(CupertinoIcons.clock,size: 16,color: Theme.of(context).textTheme.bodyText2!.color,),
                        const SizedBox(width: 8,),
                        Text(post.time,style: Theme.of(context).textTheme.bodyText2,),
                        Expanded(child: Container(
                          alignment: Alignment.centerRight,
                          child: Icon(post.isBookMark? CupertinoIcons.bookmark_fill:CupertinoIcons.bookmark, size: 16, color: Theme.of(context).textTheme.bodyText2!.color,),
                        ))
                      ],
                    )
                  ],
                ),))
        ],
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
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Color(0xff9b8487).withOpacity(0.3)
                  )
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  _BottomNavigationItem(title: 'Home',iconFileName: 'Home.png',activeIconFileName: 'Home.png',),
                  _BottomNavigationItem(title: 'Articles',iconFileName: 'Articles.png',activeIconFileName: 'Articles.png',),
                  SizedBox(width: 8,),
                  _BottomNavigationItem(title: 'Search',iconFileName: 'Search.png',activeIconFileName: 'Search.png',),
                  _BottomNavigationItem(title: 'Menu',iconFileName: 'Menu.png',activeIconFileName: 'Menu.png',),
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
                    color: Color(0xff376AED),
                    borderRadius: BorderRadius.circular(32.5),
                    border: Border.all(width: 4,color: Colors.white)
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

class _BottomNavigationItem extends StatelessWidget {

  final String title;
  final String iconFileName;
  final String activeIconFileName;
  
  const _BottomNavigationItem({
    Key? key, 
    required this.title, 
    required this.iconFileName, 
    required this.activeIconFileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/img/icons/${iconFileName}'),
        const SizedBox(height: 4,),
        Text(title,style: Theme.of(context).textTheme.caption,)
      ],
    );
  }
}

class Boarding extends StatefulWidget{
  @override
  State<Boarding> createState() => _BoardingState();
}

class _BoardingState extends State<Boarding> {
  PageController _pageController= PageController();

  final items= AppDatabase.onBoardingItem;

  int page= 0;

  @override
  void initState() {
    _pageController.addListener(() { 
      if(_pageController.page!.round()!=page){
        page = _pageController.page!.round();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Assets.img.background.onboard.image(fit: BoxFit.cover)),
          Positioned.fill(
            top: 250,
            child: Column(
            children: [
              Assets.img.icons.youtube.svg(width: 100,height: 100),
              Text('PAPILOO',style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black),)
            ],
          )),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child:Container(
              height: 300,
              decoration:const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(32),topRight: Radius.circular(32)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                  )
                ]
              ),
              child: Column(
                children: [
                  Expanded(child: PageView.builder(
                    itemCount: items.length,
                    controller: _pageController,
                    itemBuilder:((context, index) {
                      final item = items[index];
                      return Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.title,style: Theme.of(context).textTheme.headline6,),
                            const SizedBox(height: 8,),
                            Text(item.description,style: Theme.of(context).textTheme.subtitle1,)
                          ],
                        ),
                      );
                    }) )),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmoothPageIndicator(
                          controller: _pageController,
                          effect: ExpandingDotsEffect(
                            activeDotColor: Colors.blue,
                            dotHeight: 8,
                            dotWidth: 8,
                            dotColor: Colors.blue.withOpacity(0.1)
                          ), 
                          count: items.length),
                          ElevatedButton(
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(const Size(84, 60)),
                              backgroundColor: MaterialStateProperty.all(Colors.blue),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)
                                )
                              )
                            ),
                            onPressed: (){
                              if(page== items.length-1){
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context)=> HomeScreen())
                                );
                              }
                              else{
                                _pageController.animateToPage(page+1, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
                              }
                            }, 
                            child:  Icon(page == items.length-1?CupertinoIcons.check_mark:CupertinoIcons.arrow_right)),
                      ],
                    ),
                  )  
                ],
              ),
            ) )
        ],
      ),
    );
  }
}

class Auth extends StatefulWidget{

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  static const int loginTab=0;
  static const int signUpTab=1;
  int selectedTabIndex= loginTab;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 32, 0, 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.img.icons.youtube.svg(width: 50,height: 50,color: Theme.of(context).primaryColor),
                  Text('papiloo'.toUpperCase(),style: Theme.of(context).textTheme.headline6!.apply(color: Theme.of(context).primaryColor))
                ],
              ),
            ),
            Expanded(
              child:Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  )
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTabIndex = loginTab;
                              });
                            },
                            child: Text('login'.toUpperCase(),style: Theme.of(context).textTheme.headline6!.apply(color:selectedTabIndex==loginTab? Colors.white:Colors.white54),)),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTabIndex = signUpTab;
                              });
                            },
                            child: Text('sign up'.toUpperCase(),style: Theme.of(context).textTheme.headline6!.apply(color:selectedTabIndex==signUpTab?Colors.white: Colors.white54),))
                        ],
                      ),
                    ),
                    Expanded(
                      child:Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          )
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding:const  EdgeInsets.fromLTRB(32, 48, 32, 32),
                            child:selectedTabIndex==loginTab? _Login():_SignUp(),
                          ),
                        ),
                      ) )
                  ],
                ),
              ) )
          ],
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome',style: Theme.of(context).textTheme.headline6,),
        const SizedBox(height: 8,),
        Text('sign in with your acount', style: Theme.of(context).textTheme.subtitle1!.apply(fontSizeFactor: 0.9)),
        const SizedBox(height: 16,),
        const TextField(
          decoration: InputDecoration(label: Text('username')),
        ),
        const SizedBox(height: 12,),
        PasswordTextField(),
        const SizedBox(height: 24,),
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              )
            ),
            minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 60))
          ),
          onPressed: (){}, child: Text('login'.toUpperCase())
        ),
        const SizedBox(height: 32,),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Forget your password?'),
              const SizedBox(width: 8,),
              TextButton(onPressed: (){}, child:const Text('Reset here'))
            ],
          ),
        ),
        const SizedBox(height: 16,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('OR SIGN IN WITH',style: TextStyle(letterSpacing: 2),),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.img.icons.google.image(width: 32,height: 32),
                const SizedBox(width: 24,),
                Assets.img.icons.facebook.image(width: 32,height: 32),
                const SizedBox(width: 24,),
                Assets.img.icons.twitter.image(width: 32,height: 32),
              ],
            )
          ],
        )
      
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome to papiloo',style: Theme.of(context).textTheme.headline6,),
        const SizedBox(height: 8,),
        Text('please enter your information', style: Theme.of(context).textTheme.subtitle1!.apply(fontSizeFactor: 0.9)),
        const SizedBox(height: 16,),
        const TextField(
          decoration: InputDecoration(label: Text('Fullname')),
        ),
        const SizedBox(height: 12,),
        const TextField(
          decoration: InputDecoration(label: Text('username')),
        ),
        const SizedBox(height: 12,),
        PasswordTextField(),
        const SizedBox(height: 24,),
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              )
            ),
            minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 60))
          ),
          onPressed: (){}, child: Text('sign up'.toUpperCase())
        ),
        const SizedBox(height: 32,),
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('OR SIGN UP WITH',style: TextStyle(letterSpacing: 2),),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.img.icons.google.image(width: 32,height: 32),
                const SizedBox(width: 24,),
                Assets.img.icons.facebook.image(width: 32,height: 32),
                const SizedBox(width: 24,),
                Assets.img.icons.twitter.image(width: 32,height: 32),
              ],
            )
          ],
        )
      
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {

  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {

  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      autocorrect: false,
      enableSuggestions: false,
      obscureText: obscureText,
      decoration: InputDecoration(
        label: Text('password'),
        suffix: TextButton(
          onPressed:(){
            setState(() {
              obscureText =! obscureText;
            });
          } , 
          child:Text(obscureText?'show':'hide'))
        ),
    );
  }
}

class Article extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 111,
        height: 48,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5)
            )
          ]
        ),
        child: InkWell(
          onTap: () {
            showSnackBar(context, 'you liked');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.thumbs.svg(color: Theme.of(context).colorScheme.onPrimary),
              Text('2.1k',style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.w400,fontSize: 16),)
            ],
          ),
        ),
        
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('papiloo'),
            actions: [
              IconButton(onPressed: (() {
                
              }), icon: const Icon(CupertinoIcons.ellipsis_vertical)),
              const SizedBox(width: 16,)
            ],
          ),
          SliverList(delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
              child: Text('Four Things Every Man Needs To Know',style: Theme.of(context).textTheme.headline4!.apply(color: Colors.black),),
            ),
            Row(
              children: [
                Assets.img.stories.story1.image(width: 48,height: 48,fit: BoxFit.cover),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start  ,
                  children: [
                    Text('Elias Rostami',style: Theme.of(context).textTheme.bodyText1,),
                    const SizedBox(height: 4,),
                    Text('2m ago')
                  ],
                )),

              ],
            )
          ]))
        ],
      ),
    );
  }
  void showSnackBar(BuildContext context,String message){

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}