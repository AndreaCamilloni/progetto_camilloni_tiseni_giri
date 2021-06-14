/* Questa classe identifica la bottom navigation bar, nella quale si inseriscono
le varie destinazioni
 */

import 'package:flutter/material.dart';
import 'package:progetto_camilloni_tiseni_giri/prova.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Text("home"),
    Text("popo"),
    Text("Home"),
    Text("Home"),
    Prova(),
    //Home(),
    //Catalogo(),
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
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Catalogo'),
            icon: Icon(Icons.menu),
          ),
          BottomNavigationBarItem(
            title: Text('I tuoi Corsi'),
            icon: Icon(Icons.move_to_inbox_sharp),
          ),
          BottomNavigationBarItem(
            title: Text('Wishlist'),
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            title: Text('Utente'),
            icon: Icon(Icons.person),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      )
    );
  }
}
