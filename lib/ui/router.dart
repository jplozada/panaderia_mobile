import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './views/products/addProduct.dart';
import './views/products/productDetails.dart';
import './views/inventory/addInventory.dart';
import './views/inventory/inventoryDetails.dart';
import './views/homeView.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return  MaterialPageRoute(
          builder: (_)=> HomeView()
        );
      case '/addProduct' :
        return MaterialPageRoute(
          builder: (_)=> AddProduct()
        ) ;
      case '/productDetails' :
        return MaterialPageRoute(
            builder: (_)=> ProductDetails()
        ) ;
      case '/addInventory' :
        return MaterialPageRoute(
            builder: (_)=> AddInventory()
        ) ;
      case '/inventoryDetails' :
        return MaterialPageRoute(
            builder: (_)=> InventoryDetails()
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