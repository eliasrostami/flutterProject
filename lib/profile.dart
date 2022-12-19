import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_train/data.dart';
import 'package:flutter_application_train/gen/assets.gen.dart';
import 'package:flutter_application_train/home.dart';

class ProfileScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Profile'),
            actions: [
              IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.ellipsis_vertical)),
              const SizedBox(width: 16,)
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                width: MediaQuery.of(context).size.width,
                decoration:const BoxDecoration(
                  color: Color.fromARGB(255, 241, 241, 241)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(32, 32, 32, 64),
                          decoration: BoxDecoration(
                            color: themeData.colorScheme.surface,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Assets.img.stories.story5.image(width: 84,height: 84)),
                                    const SizedBox(width: 16,),
                                    Expanded(child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text('@erst'),
                                        Text('Elias Rostami',style: themeData.textTheme.bodyText1,),
                                        Text('Web Developer',style: themeData.textTheme.bodyText1!.apply(color: themeData.colorScheme.primary),),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                                child: Text('About me',style: themeData.textTheme.headline6,),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(32, 0, 32, 64),
                                child: Text('This project is a starting point for a Flutter application.A few resources to get you started if this is your first Flutter project:',
                                    style: themeData.textTheme.bodyText1,
                                  ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 96,
                          left: 96,
                          child: Container(
                            height: 32,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 30,
                                  color: themeData.colorScheme.onBackground.withOpacity(0.5)
                                )
                              ]
                            ),
                          )
                        ),
                        Positioned(
                          bottom: 32,
                          right: 64,
                          left: 64,
                          child: Container(
                            height: 68,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 59, 105, 219),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [BoxShadow(
                                blurRadius: 10,
                                color: Colors.blue.withOpacity(0.5)
                              )]
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff2151CD),
                                      borderRadius: BorderRadius.circular(12)
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('52',style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: themeData.colorScheme.onPrimary
                                        ),),  
                                        Text('Post',style: themeData.textTheme.bodyText1!.apply(color: themeData.colorScheme.onPrimary),)
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('250',style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: themeData.colorScheme.onPrimary
                                      ),),  
                                      Text('Following',style: themeData.textTheme.bodyText1!.apply(color: themeData.colorScheme.onPrimary),)
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('4.5M',style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: themeData.colorScheme.onPrimary
                                      ),),  
                                      Text('Followers',style: themeData.textTheme.bodyText1!.apply(color: themeData.colorScheme.onPrimary),)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.surface,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32)
                        )
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text('My Posts',style: themeData.textTheme.headline6,)
                                ),
                                IconButton(onPressed: (){}, icon: Assets.img.icons.grid.svg() ),
                                IconButton(onPressed: (){}, icon: Assets.img.icons.table.svg() ),
                              ],
                            ),
                          ),
                          for(var i=0; i<posts.length; i++) ShowPost(post: posts[i]),
                          const SizedBox(height: 32,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              
            ])
          )
        ],
      ),
    );
  }
}