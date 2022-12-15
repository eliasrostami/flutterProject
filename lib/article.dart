import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_train/gen/assets.gen.dart';

class ArticleScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final themeDate = Theme.of(context);
    return Scaffold(
      floatingActionButton: Container(
        width: 111,
        height: 48,
        decoration: BoxDecoration(
          color: themeDate.colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(
            blurRadius: 20,
            color: themeDate.colorScheme.primary.withOpacity(0.5)
          )]
        ),
        child: InkWell(
          onTap: (() {
            showSnackBar(context, 'like');
          }),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.thumbs.svg(color:themeDate.colorScheme.onPrimary),
              const SizedBox(width: 4,),
              Text('12.1k',style: TextStyle(
                color: themeDate.colorScheme.onPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w400
              )  ,)
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                title: const Text('Article'),
                actions: [
                  IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.ellipsis_vertical)),
                  const SizedBox(width: 16,)
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Text('Four Things Every Woman Needs To Know', style: themeDate.textTheme.headline4!.apply(color: Colors.black),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Assets.img.stories.story1.image(width: 48,height: 48,fit: BoxFit.cover)),
                        const SizedBox(width: 16,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Elias Rostami', style: themeDate.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w400),),
                              const SizedBox(height: 4,),
                              const Text('2m ago')
                            ],
                          ),
                        ),
                        IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bookmark,color: themeDate.colorScheme.primary,),),
                        IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.share,color: themeDate.colorScheme.primary),),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    child: Assets.img.posts.large.largePost1.image()
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                    child: Text('Four Things Every Woman Needs To Know',style: themeDate.textTheme.headline5,),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
                    child: Text('Thank you for using Googles APIs, other developer services, and associated software (collectively, "APIs"). By accessing or using our APIs, you are agreeing to the terms below. If there is a conflict between these terms and additional terms applicable to a given API, the additional terms will control for that conflict. Collectively, we refer to the terms below, any additional terms, terms within the accompanying API documentation, and any applicable policies and guidelines as the "Terms." You agree to comply with the Terms and that the Terms control your relationship with us. So please read all the Terms carefully. If you use the APIs as an interface to, or in conjunction with other Google products or services, then the terms for those other products or services also apply.',),
                  )
                ]),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 116,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    themeDate.colorScheme.surface,
                    themeDate.colorScheme.surface.withOpacity(0)
                  ])
              ),
            ),
          )
        ],
      ),
    );
  }
  
  void showSnackBar(BuildContext context,String message){

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),behavior:SnackBarBehavior.fixed,));
    
  }
}