import 'package:flutter/material.dart';
import 'package:prueba1/ui/views/products/readProduct.dart';
import 'package:prueba1/ui/views/inventory/readInventory.dart';

class HomeProducts extends StatefulWidget {
  @override
  _HomeProductsState createState() => _HomeProductsState();
}

class _HomeProductsState extends State<HomeProducts> {int _currentIndex = 0;
  final List<Widget> _children = [
    Page1(Colors.white),
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

