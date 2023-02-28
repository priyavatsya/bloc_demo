import 'package:flutter/material.dart';

import '../screens/homescreen_get_post_methods/homepage.dart';
import '../screens/offline_data_screen/movie_screen.dart';
import '../screens/offline_data_screen/mydatahomepage.dart';
import '../screens/offline_data_screen/user_database.dart';
import '../widgets/utils/constant.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List pages = [
    HomePage(),
    Home(),
    Home_Pages(),
   // Home_Pages(),
   // UserDatabase(),
    //MoviesListScreen(),
    // InfoPage(),
    // PetPage(),
    // LogPage(),
    // HeroPage(),
    //FavPage()
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        backgroundColor: AppColors.PRIMARY_COLOR_BDark,
        elevation: 25,
        // showSelectedLabels: false,
        // showUnselectedLabels: true,
        iconSize: 25,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: AppColors.ORANGE,
        unselectedItemColor: AppColors.PRIMARY_DARK_LIGHT,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.note_alt_rounded), label: 'Info'),
          // BottomNavigationBarItem(icon: Icon(Icons.pets), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.security), label: 'Security'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'LogOut'),
          //BottomNavigationBarItem(icon: Icon(Icons.library_add), label: 'Lib'),
        ],

      ),
    );
  }
}
