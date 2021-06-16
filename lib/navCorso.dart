import 'package:flutter/material.dart';
import 'package:progetto_camilloni_tiseni_giri/YourCourses.dart';
//import 'package:progetto_camilloni_tiseni_giri/prova.dart';
import 'package:progetto_camilloni_tiseni_giri/Home.dart';
import 'package:progetto_camilloni_tiseni_giri/Catalogo.dart';

import 'InfoCorso.dart';
import 'Lezioni.dart';
import 'models/Corso.dart';

class NavCorso extends StatefulWidget {
  final Corso corso;
  const NavCorso(this.corso);
  @override
  _NavCorsoState createState() => _NavCorsoState();
}

class _NavCorsoState extends State<NavCorso> {
  int _selectedIndex = 0;


  void _onItemTap(int index){
    setState((){
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context){
    List<Widget> _widgetOptions = <Widget>[
      InfoCorso(widget.corso),
      Lezioni(),
      Text("popo"),
      //Dispense(),

      //Corsi(),
      //Wishlist(),
      //Profilo(),
    ];
    return Scaffold(
        appBar: AppBar(
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