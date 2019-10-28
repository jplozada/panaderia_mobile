import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './views/inventory/addInventory.dart';
import './views/inventory/inventoryDetails.dart';
import './views/production/addProduction.dart';
import './views/production/productionDetails.dart';
import './views/homeView.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return  MaterialPageRoute(
          builder: (_)=> HomeView()
        );
      case '/addInventory' :
        return MaterialPageRoute(
          builder: (_)=> AddInventory()
        ) ;
      case '/inventoryDetails' :
        return MaterialPageRoute(
            builder: (_)=> InventoryDetails()
        ) ;
      case '/addProduction' :
        return MaterialPageRoute(
            builder: (_)=> AddProduction()
        ) ;
      case '/productionDetails' :
        return MaterialPageRoute(
            builder: (_)=> ProductionDetails()
        ) ;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}