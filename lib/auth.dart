import 'package:flutter/material.dart';

import 'main.dart';

class AuthScreen extends StatefulWidget {

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signUpTab = 1;
  int selectedTabIndex = loginTab;

  @override
  Widget build(BuildContext context) {

    final ThemeData themeData = Theme.of(context);
    final tabTextStyle = TextStyle(
      color: themeData.colorScheme.onPrimary,
      fontSize: 18,
      fontWeight: FontWeight.bold
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                alignment: Alignment.topCenter,
                  child: Image.asset('assets/img/background/logo.png', width: 250,)),
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32))
              ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    selectedTabIndex = loginTab;


                                  });
                                },
                                child: Text("Login".toUpperCase(), style: tabTextStyle.apply(color: selectedTabIndex == loginTab ? Colors.white : Colors.white24)
                                   )),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    selectedTabIndex = signUpTab;
                                  });
                                },
                                child: Text("Signup".toUpperCase(), style:tabTextStyle.apply(color: selectedTabIndex == signUpTab ? Colors.white : Colors.white24) ,
                                   )),
                          ],
                        ),
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,

                        decoration: const BoxDecoration(
                            color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32))

                        ),
                              child:   Padding(
                                padding: EdgeInsets.all(30),
                                child: selectedTabIndex == loginTab ? _Login() : _SigunUp(),
                              ),
                      ),
                          ))
                    ],
                  ) ,
            ),
            )
          ],
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
   _Login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome back', style: Theme.of(context).textTheme.titleLarge?.apply(fontSizeDelta: 2),),
        const SizedBox(height: 10,),
        Text('Sign in your account', style: Theme.of(context).textTheme.titleMedium?.apply(color: Colors.black54),),
        const SizedBox(height: 30,),
          TextField(
          obscureText: false,
          enableSuggestions: false,
          autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
            label: Text('Username'),
            prefixIcon: Icon(Icons.person)
          ),
        ),
          _PasswordTextField(),
        const SizedBox(height: 40,),
        ElevatedButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 50)
            ),
            backgroundColor: MaterialStateProperty.all(Colors.blue)
          ),
            onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainScreen()));
            },
            child:  Text('LOGIN', style: TextStyle(color: Colors.white, fontSize: 18))
        ),
        const SizedBox(height: 40,),

         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Forgot your password?!', style: Theme.of(context).textTheme.titleSmall,),
            const SizedBox(width: 30,),
            TextButton(onPressed: (){}, child: Text('Reset here', style: Theme.of(context).textTheme.titleSmall?.apply(color: Colors.blue),))
          ]
        ),
        const SizedBox(height: 30,),
         Center(child: Text('Or SIGN IN WITH')),
        const SizedBox(height: 30,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/img/icons/Twitter.png', width: 50,),
            Image.asset('assets/img/icons/Facebook.png',width: 50, ),
            Image.asset('assets/img/icons/Google.png', width: 50,),
          ],
        )
      ],
    );
  }
}
class _SigunUp extends StatelessWidget {
   _SigunUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome to my app', style: Theme.of(context).textTheme.titleLarge?.apply(fontSizeDelta: 2),),
        const SizedBox(height: 10,),
        Text('Sigun up your account', style: Theme.of(context).textTheme.titleMedium?.apply(color: Colors.black54),),
        const SizedBox(height: 30,),
          const TextField(
          obscureText: false,
          enableSuggestions: false,
          autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
            label: Text('Username'),
            prefixIcon: Icon(Icons.person)
          ),
        ),
          const TextField(
          obscureText: false,
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            label: Text('Email'),
            prefixIcon: Icon(Icons.email)
          ),
        ),
          _PasswordTextField(),
        const SizedBox(height: 40,),
        ElevatedButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 50)
            ),
            backgroundColor: MaterialStateProperty.all(Colors.blue)
          ),
            onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainScreen()));
            },
            child:  Text('SignUp', style: TextStyle(color: Colors.white, fontSize: 18))
        ),

        const SizedBox(height: 30,),
         Center(child: Text('Or SIGN Up WITH')),
        const SizedBox(height: 30,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/img/icons/Twitter.png', width: 50,),
            Image.asset('assets/img/icons/Facebook.png',width: 50, ),
            Image.asset('assets/img/icons/Google.png', width: 50,),
          ],
        )
      ],
    );
  }
}

class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField({
    super.key,
  });

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(

     obscureText: obscureText,
     enableSuggestions: false,
     autocorrect: false,
     decoration: InputDecoration(
         label: const Text('Password'),
       prefixIcon: const Icon(Icons.lock),
       suffixIcon: TextButton(onPressed: (){
         setState(() {
           obscureText =!obscureText;
         });
       }, child: Text( obscureText==true ? 'Show' : 'Hide'))

     ),
                                    );
  }
}
