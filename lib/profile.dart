import 'package:flutter/material.dart';
import 'package:untitteld7/data.dart';

import 'home.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        // backgroundColor:themeData.colorScheme.background.withOpacity(0),
        actions: [
          IconButton(
            onPressed: (){},
              icon: Icon(Icons.more_horiz_rounded)),
          SizedBox(width: 20,),
          
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  margin: EdgeInsets.fromLTRB(32, 15, 32, 32),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: themeData.colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: themeData.colorScheme.onBackground.withOpacity(0.2),
                      )
                    ]
                  ),
                  child: Padding(
                    padding:  EdgeInsets.fromLTRB(32, 20, 32, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(

                                child: Image.asset("assets/img/icons/me.jpg", width: 80,),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('@arshiajs'),
                                  Text('Arshiajs', style: Theme.of(context).textTheme.titleLarge?.apply(fontSizeDelta: 4)),
                                  Text('Flutter Developer', style: Theme.of(context).textTheme.titleMedium),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text('About me', style: Theme.of(context).textTheme.titleLarge),
                        Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been , www.arshiajs.ir')

                      ],
                    ),
                  ),
                ),
                //onlu for shadow under blue container
                Positioned(
                    bottom: 0,
                    left: 96,
                    right: 96,
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 30,
                            color: themeData.colorScheme.onBackground
                                .withOpacity(0.8)),
                      ]),
                    )),


                Positioned(
                  bottom: 0,
                  left: 64,
                  right: 64,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff2151CD),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('52', style: Theme.of(context).textTheme.titleLarge?.apply(color: Colors.white),),
                                SizedBox(height: 5,),
                                Text('Post', style: Theme.of(context).textTheme.titleMedium?.apply(color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('250', style: Theme.of(context).textTheme.titleLarge?.apply(color: Colors.white),),
                              SizedBox(height: 5,),
                              Text('Following', style: Theme.of(context).textTheme.titleMedium?.apply(color: Colors.white),),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('4.5K', style: Theme.of(context).textTheme.titleLarge?.apply(color: Colors.white),),
                              SizedBox(height: 5,),
                              Text('Followers', style: Theme.of(context).textTheme.titleMedium?.apply(color: Colors.white),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: themeData.colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'My Posts',
                            style: themeData.textTheme.headline6,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.table_chart)
                        ),
                        IconButton(
                          onPressed: () {},
                            icon: Icon(Icons.grid_3x3_sharp)
                        ),
                      ],
                    ),
                  ),
                  for (var i = 0; i < posts.length; i++)
                    Post(post: posts[i]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
