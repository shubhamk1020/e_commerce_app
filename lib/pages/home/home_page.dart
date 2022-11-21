import 'package:e_commerce_app/pages/cart/cart_history.dart';
import 'package:e_commerce_app/pages/home/main_food_page.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

  class _HomePageState extends State<HomePage> {




    int _selectedIndex = 0;
   List pages =[
      MainFoodPage(),
      Container(child: Center(child: Text("shubham kumar ")),),
      CartHistory(),
      Container(child: Center(child: Text("aarti kumari ")),),
     
    ];

    void onTapNav(int index){
      setState(() {
        _selectedIndex=index;
        });
      }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: Colors.amber,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          onTap: onTapNav,
          items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),
          label: "Home"),

            BottomNavigationBarItem(icon: Icon(Icons.archive),
          label: "Archive"),

            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),
          label: "Cart"),

            BottomNavigationBarItem(icon: Icon(Icons.person),
          label: "Account"),
        ]),
      );
    }

}
