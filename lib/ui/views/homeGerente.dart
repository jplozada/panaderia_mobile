import 'package:flutter/material.dart';
import 'package:prueba1/ui/views/inventory/readInventory.dart';
import 'package:prueba1/ui/views/production/readProduction.dart';
import 'package:prueba1/ui/views/sales/readSales.dart';

class HomeGerente extends StatefulWidget {
  @override
  _HomeGerenteState createState() => _HomeGerenteState();
}

class _HomeGerenteState extends State<HomeGerente> {int _currentIndex = 0;
  final List<Widget> _children = [
    Page1(Colors.white),
    Page2(Colors.deepOrange),
    Page3(Colors.blueAccent),
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
            title: Text('Inventario'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Produccion'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_mall_directory),
            title: Text('Ventas'),
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
    return ReadInventory();
  }
}

class Page2 extends StatelessWidget {
  final Color color;

  Page2(this.color);

  @override
  Widget build(BuildContext context) {
    return ReadProduction();
  }
}

class Page3 extends StatelessWidget {
  final Color color;

  Page3(this.color);

  @override
  Widget build(BuildContext context) {
    return ReadSales();
  }
}

