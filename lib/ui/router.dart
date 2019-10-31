import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prueba1/ui/views/inventory/readInventory.dart';
import 'package:prueba1/ui/views/production/readProduction.dart';
import './views/inventory/addInventory.dart';
import './views/inventory/inventoryDetails.dart';
import './views/production/addProduction.dart';
import './views/production/productionDetails.dart';
import './views/homeView.dart';
//import './views/homeProduction.dart';

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
      // case '/inventoryDetails' :
      //   return MaterialPageRoute(
      //       builder: (_)=> InventoryDetails()
      //   ) ;
      case '/readInventory' :
        return MaterialPageRoute(
            builder: (_)=> ReadInventory()
        ) ;
      case '/addProduction' :
        return MaterialPageRoute(
            builder: (_)=> AddProduction()
        ) ;
      // case '/productionDetails' :
      //   return MaterialPageRoute(
      //       builder: (_)=> ProductionDetails()
      //   ) ;
      case '/readProduction' :
        return MaterialPageRoute(
            builder: (_)=> ReadProduction()
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