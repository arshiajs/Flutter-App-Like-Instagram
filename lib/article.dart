import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ArtcileScreen extends StatelessWidget {

  const ArtcileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return  Scaffold(
      floatingActionButton: InkWell(
        onTap: (){
          showSnackBar(context, 'like is clicked!');
        },
        child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black54.withOpacity(0.2)
              )
            ],
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.thumb_up_sharp, color: Colors.white,),
              SizedBox(width: 10,),
              Text('2.1K', style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                // pinned: true,
                // floating: true,
                title: Text('Article', style: Theme.of(context).textTheme.titleLarge?.apply(fontSizeDelta: 5),),
                actions: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz_rounded, size: 25,),),
                  SizedBox(width: 16,),
                ],
                leading: IconButton(onPressed: (){

                }, icon: Icon(CupertinoIcons.back))
              ),
              //sliverlist is used instead of column and appbar when want to scroll down, to have different appbar shape
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                   [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text('Flutter Developer by ArShiajs', style: Theme.of(context).textTheme.titleLarge?.apply(color: Colors.blueGrey),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0, left: 15),
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset('assets/img/icons/me.jpg', width: 70, fit: BoxFit.cover, height: 70,)
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Arshiajs',style: Theme.of(context).textTheme.titleMedium?.apply(color: Colors.black87), ),
                                Text('Flutter Developer', style: Theme.of(context).textTheme.titleMedium?.apply(color: Colors.black87),),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {  },
                              icon: Icon(Icons.send)),

                          IconButton(
                              onPressed: () {
                                showSnackBar(context, 'Bookmarked!');
                              },
                              icon: Icon(Icons.bookmark_outline)),

                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Image.asset('assets/img/background/onboarding.png', width: MediaQuery.of(context).size.width,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Text('Lorem Ipsum is simply dummy text of the printing and the typesetting industry',   style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.justify,),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25),
                      child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                        style: Theme.of(context).textTheme.titleMedium,  textAlign: TextAlign.justify,),
                    ),
                    SizedBox(height: 80,),

                  ],
                ),

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
                      themeData.colorScheme.surface,
                      themeData.colorScheme.surface.withOpacity(0),

                    ]
                )
              ),
            ),
          )
        ],
      ),
    );
  }
  void showSnackBar(BuildContext context, String message){
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
