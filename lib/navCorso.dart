import 'package:flutter/material.dart';
import 'package:progetto_camilloni_tiseni_giri/YourCourses.dart';
//import 'package:progetto_camilloni_tiseni_giri/prova.dart';
import 'package:progetto_camilloni_tiseni_giri/Home.dart';
import 'package:progetto_camilloni_tiseni_giri/Catalogo.dart';

import 'InfoCorso.dart';
import 'Lezioni.dart';

class NavCorso extends StatefulWidget {
  @override
  _NavCorsoState createState() => _NavCorsoState();
}

class _NavCorsoState extends State<NavCorso> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    InfoCorso(),
    Lezioni(),
    Text("popo"),
    //Dispense(),

    //Corsi(),
    //Wishlist(),
    //Profilo(),
  ];

  void _onItemTap(int index){
    setState((){
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('ProgettoFlutter'),
        ),
        body: Center(
            child: _widgetOptions.elementAt(_selectedIndex)
        ),
        bottomNavigationBar:BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF6200EE),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          items: [
            BottomNavigationBarItem(
              title: Text('Info'),
              icon: Icon(Icons.info_outline),
            ),
            BottomNavigationBarItem(
              title: Text('Lezioni'),
              icon: Icon(Icons.menu_book_outlined),
            ),
            BottomNavigationBarItem(
              title: Text('Dispense'),
              icon: Icon(Icons.insert_drive_file),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
        )
    );
  }
}