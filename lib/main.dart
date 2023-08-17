import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitteld7/profile.dart';
import 'package:untitteld7/splash.dart';
import 'article.dart';
import 'home.dart';


void main() {
  //this part is for changing the system navigation bar to => white
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defaultFontFamily = 'avenir';
  static const defaultBoldFontFamily = 'avenirbold';
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);
    const primaryColor = Color(0xff376AED);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          titleSpacing: 32,
          backgroundColor: Colors.white,
          foregroundColor: primaryTextColor,
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: primaryColor,
          contentTextStyle: TextStyle(fontSize: 20),
        ) ,
        colorScheme:  const ColorScheme.light(
            primary: primaryColor,
            onPrimary: Colors.white,
            onSurface: primaryTextColor,
            background: Color(0xffFBFCFF),
            surface: Colors.white,
            onBackground: primaryTextColor),

        textTheme: const TextTheme(
          titleLarge: TextStyle(fontFamily: defaultBoldFontFamily, color: primaryTextColor),
          titleSmall: TextStyle(fontFamily: defaultFontFamily, color: primaryTextColor, fontSize: 15, fontWeight: FontWeight.w600),
          titleMedium: TextStyle(fontFamily: defaultFontFamily, fontSize: 17, color: secondaryTextColor, fontWeight: FontWeight.w600),
        ),

        useMaterial3: true,
      ),
      // home:  Stack(
      //   children: [
      //     Positioned.fill(child: HomeScreen()),
      //     Positioned(
      //       bottom: 0,
      //         right: 0,
      //         left: 0,
      //         child: _BottomNavigation()),
      //   ],
      // ),
      home: SplashScreen(),
    );
  }
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int menuIndex = 3;
const double bottomNavigationHeight = 65;


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;
  final List<int> _history = [];


  GlobalKey<NavigatorState> _homeKey = GlobalKey();
  GlobalKey<NavigatorState> _articleKey = GlobalKey();
  GlobalKey<NavigatorState> _searchKey = GlobalKey();
  GlobalKey<NavigatorState> _menuKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    searchIndex: _searchKey,
    menuIndex: _menuKey,
  };

  Future<bool> _onWillPop() async{
    final NavigatorState currentSelectedTabNavigatorState = map[selectedScreenIndex]!.currentState!;
    if(currentSelectedTabNavigatorState.canPop()){
    currentSelectedTabNavigatorState.pop();
    return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }
    return true;
  }
  @override
  Widget build(BuildContext context) {

    //willpop scope is for back bottom to not exit from the app

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              //this is for having space from bottom of last post or ...
              bottom:bottomNavigationHeight,
              child: IndexedStack(
                index: selectedScreenIndex,
                children: [
                  Navigator(
                    key: _homeKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) => HomeScreen()) ,),
                  Navigator(
                    key: _articleKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) => ArtcileScreen()) ,),
                  Navigator(
                    key: _searchKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) => SearchScreen()) ,),
                  Navigator(
                    key: _menuKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) => ProfileScreen()) ,),
                  ]
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _BottomNavigation(
                onTap: (int index){
                  setState(() {
                    //this is for backing bottombar to homepage no exit from app
                    _history.remove(selectedScreenIndex);
                    _history.add(selectedScreenIndex);
                    selectedScreenIndex = index;
                  });
                }, selectedIndex:selectedScreenIndex ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search', style: Theme.of(context).textTheme.titleLarge,),
    );
  }
}



class _BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;
  const _BottomNavigation({super.key, required this.onTap, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration:  BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Color(0xff9b8487).withOpacity(0.3),
                  )
                ]
              ),
              child:   Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavigationItem(
                    onTap: (){
                      onTap(homeIndex);

                    },
                      iconFileName: 'Home.png',
                      activeIconFileName: 'Home.png',
                      title: "Home",
                    isActive: selectedIndex == homeIndex,
                  ),
                  BottomNavigationItem(
                      onTap: (){
                        onTap(articleIndex);

                      },
                      iconFileName: 'Articles.png',
                      activeIconFileName: 'Articles.png',
                      title: "Articles",
                    isActive: selectedIndex == articleIndex,

                  ),
                  SizedBox(width: 20,),
                  BottomNavigationItem(
                      onTap: (){
                        onTap(searchIndex);

                      },
                      iconFileName: 'Search.png',
                      activeIconFileName: 'Search.png',
                      title: "Search",
                    isActive: selectedIndex == searchIndex,

                  ),
                  BottomNavigationItem(
                      onTap: (){
                        onTap(menuIndex);

                      },
                      iconFileName: 'Menu.png',
                      activeIconFileName: 'Menu.png',
                      title: "Menu",
                    isActive: selectedIndex == menuIndex,

                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.topCenter,
              child: Container(
                height: bottomNavigationHeight,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.5),
                    color: Colors.blueAccent,
                    border: Border.all(color: Colors.white, width: 5)
                  ),
                  child: Icon(CupertinoIcons.plus, color: Colors.white,size: 30,)),

            ),
          )
        ],
      ),

    );
  }
}


class BottomNavigationItem extends StatelessWidget {

  final String iconFileName;
  final String activeIconFileName;
  final String title;
  final Function() onTap;
  final bool isActive;
  const BottomNavigationItem({super.key, required this.iconFileName, required this.activeIconFileName, required this.title, required this.onTap, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/img/icons/$iconFileName'),
          Text(title, style: Theme.of(context).textTheme.titleSmall?.apply(color: isActive ? Colors.blue : Colors.black, fontSizeDelta: isActive ? 3 : 1 ),)
        ],

      ),
    );
  }
}
