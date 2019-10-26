import 'package:flutter/material.dart';
import 'package:prueba1/ui/views/products/readProduct.dart';
import 'package:prueba1/ui/views/inventory/readInventory.dart';

class HomeInventory extends StatefulWidget {
  @override
  _HomeInventoryState createState() => _HomeInventoryState();
}

class _HomeInventoryState extends State<HomeInventory> {int _currentIndex = 0;
  final List<Widget> _children = [
    Page1(Colors.white),
    Page2(Colors.deepOrange),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Messages'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    }); 
  }
}

//Placeholder

class Page1 extends StatelessWidget {
  final Color color;

  Page1(this.color);

  @override
  Widget build(BuildContext context) {
    return ReadProduct();
  }
}

class Page2 extends StatelessWidget {
  final Color color;

  Page2(this.color);

  @override
  Widget build(BuildContext context) {
    return ReadInventory();
  }
}

