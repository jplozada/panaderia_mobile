
import 'package:get_it/get_it.dart';
import 'package:prueba1/core/viewmodels/CRUDModelProduction.dart';

import './core/services/api.dart';
import './core/viewmodels/CRUDModelInventory.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => ApiInventory('inventory'));
  locator.registerLazySingleton(() => CRUDModelInventory()) ;
  locator.registerLazySingleton(() => ApiProduction('production'));
  locator.registerLazySingleton(() => CRUDModelProduction()) ;
}