import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ui/router.dart';
import './locator.dart';
import './core/viewmodels/CRUDModelInventory.dart';
import './core/viewmodels/CRUDModelProduction.dart';
import './core/viewmodels/CRUDModelSales.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => locator<CRUDModelInventory>()),
        ChangeNotifierProvider(builder: (_) => locator<CRUDModelProduction>()),
        ChangeNotifierProvider(builder: (_) => locator<CRUDModelSales>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        title: 'Product App',
        theme: ThemeData(),
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}