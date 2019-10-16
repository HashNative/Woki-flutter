import 'package:flutter/material.dart';
import 'package:flutter_ui_collections/widgets/bottom_navigationBar.dart';

import '../main.dart';
import 'page_coming_soon.dart';
import 'page_login.dart';
import 'page_profile.dart';
import 'page_search.dart';
import 'page_settings.dart';
import 'page_signup.dart';
import 'page_food.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int currentTab = 0;
  PageController pageController;

  _changeCurrentTab(int tab) {
    //Changing tabs from BottomNavigationBar
    setState(() {
      currentTab = tab;
      pageController.jumpToPage(0);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          drawer: Drawer(
           child: Column(
             children: <Widget>[
               UserAccountsDrawerHeader(
                 accountName: Text("Ilham"), 
                 accountEmail: null,
                 currentAccountPicture: CircleAvatar(
                   child: Text("i"),              
                 ),
                 
               ),
             ],
           ),
          ),
          body: bodyView(currentTab),
          bottomNavigationBar: BottomNavBar(changeCurrentTab: _changeCurrentTab)),
          
    );
  }

  bodyView(currentTab) {
    List<Widget> tabView = [];
    //Current Tabs in Home Screen...
    switch (currentTab) {
      case 0:
        //Hotels Page
        tabView = [SearchPage()];
        break;
      case 1:
        //Food Page
        tabView = [FoodPage()];
        break;
      case 2:
        //Profile Page
        tabView = [PageComingSoon()];
        break;
      case 3:
        //Setting Page
        tabView = [SettingPage()];
        break;
    }
    return PageView(controller: pageController, children: tabView);
  }
}
