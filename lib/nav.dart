/* Questa classe identifica la bottom navigation bar, nella quale si inseriscono
le varie destinazioni
 */

import 'package:flutter/material.dart';
import 'package:progetto_camilloni_tiseni_giri/YourCourses.dart';
import 'package:progetto_camilloni_tiseni_giri/area_utente.dart';
import 'package:progetto_camilloni_tiseni_giri/Home.dart';
import 'package:progetto_camilloni_tiseni_giri/Catalogo.dart';

import 'authentication_service.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Catalogo(),
    YourCourses(),
    Text("ciao"),
    AreaUtente(),

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
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Condividi', 'Logout'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
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

//funzione che regola il menu nella topAppBar
handleClick(String value) {
  switch (value) {
    case 'Logout':
      //context.read<AuthenticationService>().signOut(context);
      break;
    case 'Settings':
      break;
  }
}