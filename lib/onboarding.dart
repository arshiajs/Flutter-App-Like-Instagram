import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitteld7/data.dart';

import 'auth.dart';

class OnBoardingScreen extends StatefulWidget {

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  final items = AppDatabase.onBoardingItems;

  int page = 0;
  @override
  void initState() {
    _pageController.addListener(() {
      if(_pageController.page?.round()!= page){
        setState(() {
          page = _pageController.page!.round();
        });
      }
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  alignment: Alignment.topCenter,
                    child: Image.asset('assets/img/background/onboarding.png', width: 350,)),
              ),
            ),
            Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(0.2)
                  )
                ]
              ),
              child: Column(
                children: [
                  Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: items.length,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Column(
                                children: [
                                  Text(items[index].title, style: Theme.of(context).textTheme.titleLarge?.apply(fontSizeDelta: 2.5)),
                                  const SizedBox(height: 20,),
                                  Text(items[index].description, style: Theme.of(context).textTheme.titleMedium?.apply(fontSizeDelta: 1.4),)

                                ],
                              ),
                            );
                          }
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32, right: 32.0, bottom: 32),
                    child: Container(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmoothPageIndicator(
                              controller: _pageController,
                              count: items.length,
                            effect: const ExpandingDotsEffect(activeDotColor: Colors.blueAccent,
                            dotWidth: 8,
                            dotHeight: 8),
                          ),
                          ElevatedButton(onPressed: (){
                            if(page == items.length-1){
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) =>  AuthScreen()));
                            }
                            else{
                              _pageController.animateToPage(page+1,
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.decelerate);
                            }

                          },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                                minimumSize: MaterialStateProperty.all(const Size(60, 180)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                                )
                              ),
                              child: Icon( page == items.length-1
                                  ? CupertinoIcons.check_mark
                                  : CupertinoIcons.arrow_right,
                                color: Colors.white,
                                size: 25,)
                          )

                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
