
import 'package:flutter/material.dart';
import 'package:pizza_restaurant_ui/screens/gallery_list_screen.dart';
import 'package:pizza_restaurant_ui/screens/product_screen.dart';
import 'package:pizza_restaurant_ui/screens/profile_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Widget> _pages = <Widget>[
    ProductScreen(),
    GalleryListScreen(),
    ProfileScreen()];
  int _currentIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
    
      body:_pages.elementAt(_currentIndex),
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor:Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.amber,
        items: const <BottomNavigationBarItem>[
         
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Gallery',
          ),
        
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}