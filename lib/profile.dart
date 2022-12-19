import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_train/gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
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
                  color: Colors.grey
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: themeData.colorScheme.onBackground.withOpacity(0.2)
                          )
                        ]
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
                          Text('About me'),
                          Text('data')
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