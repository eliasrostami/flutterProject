
import 'package:flutter/material.dart';

import 'gen/assets.gen.dart';

class AuthScreen extends StatefulWidget{
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab=0;
  static const int signUpTab=1;
  int selectedTabIndex=loginTab;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 32, 0, 32),
              child: Column(
                children: [
                  Assets.img.icons.youtube.svg(width: 50,height: 50,color: Theme.of(context).primaryColor),
                  const SizedBox(height: 8,),
                  Text('PAPILOO',style: Theme.of(context).textTheme.headline6!.apply(color: Theme.of(context).primaryColor),),
                ],
              ),
            ),
            Expanded(
              child:Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Login'.toUpperCase(),style: Theme.of(context).textTheme.headline6!.apply(color: Colors.white),),
                          Text('sign up'.toUpperCase(),style: Theme.of(context).textTheme.headline6!.apply(color: Colors.white54),),
                        ],
                      ),
                    ),
                    Expanded(
                      child:Container(
                          decoration:const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            )
                          ),
                          child:const SingleChildScrollView(
                            child: Padding(
                              padding:  EdgeInsets.fromLTRB(32,48,32,32),
                              child: _Login(),
                            ),
                          ),
                        ),
                      ) 
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
        Text('welcome back',style: Theme.of(context).textTheme.headline6,),
        const SizedBox(height: 8,),
        Text('sign in with your acount', style: Theme.of(context).textTheme.subtitle1!.apply(fontSizeFactor: 0.9),),
        const SizedBox(height: 16,),
        const TextField(decoration: InputDecoration(label: Text('Username')),),
        const SizedBox(height: 12,),
        PasswordTextField(),
        const SizedBox(height: 24,),
        ElevatedButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              Size(MediaQuery.of(context).size.width, 60)
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              )
            )
          ),
          onPressed: (() {
            
          }), 
          child: Text('login'.toUpperCase())),
        const SizedBox(height: 32,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Forget your password?',),
            const SizedBox(width: 8,),
            TextButton(onPressed: (() {
              
            }), child: Text('Reset here',style: Theme.of(context).textTheme.bodyText2!.apply(color: Theme.of(context).primaryColor),))
          ],
        ),
        const SizedBox(height: 16,),
        Center(
          child: Column(
            children: [
              Text('or sign in with'.toUpperCase(),style:TextStyle(letterSpacing: 2,) ,),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.img.icons.google.image(width: 36,height: 36),
                  const SizedBox(width: 24,),
                  Assets.img.icons.facebook.image(width: 36,height: 36),
                  const SizedBox(width: 24,),
                  Assets.img.icons.twitter.image(width: 36,height: 36),
                ],
              )
            ],
          )
            
          
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
        Text('welcome to papiloo',style: Theme.of(context).textTheme.headline6,),
        const SizedBox(height: 8,),
        Text('sign up with your acount', style: Theme.of(context).textTheme.subtitle1!.apply(fontSizeFactor: 0.9),),
        const SizedBox(height: 16,),
        const TextField(decoration: InputDecoration(label: Text('Username')),),
        const SizedBox(height: 12,),
        PasswordTextField(),
        const SizedBox(height: 24,),
        ElevatedButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              Size(MediaQuery.of(context).size.width, 60)
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              )
            )
          ),
          onPressed: (() {
            
          }), 
          child: Text('sign up'.toUpperCase())),
        const SizedBox(height: 32,),
        
        Center(
          child: Column(
            children: [
              Text('or sign up with'.toUpperCase(),style:TextStyle(letterSpacing: 2,) ,),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.img.icons.google.image(width: 36,height: 36),
                  const SizedBox(width: 24,),
                  Assets.img.icons.facebook.image(width: 36,height: 36),
                  const SizedBox(width: 24,),
                  Assets.img.icons.twitter.image(width: 36,height: 36),
                ],
              )
            ],
          )
            
          
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
  bool obscureText=true;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        suffix: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          }, 
          child: Text(
            obscureText?'show':'hide',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).primaryColor
            ),
            )) ,
        label:const Text('Password')),);
  }
}