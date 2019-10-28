import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../services/api.dart';
import '../models/productionModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModelProduction extends ChangeNotifier {
  ApiProduction _api = locator<ApiProduction>();

  List<Production> products;


  Future<List<Production>> fetchProducts() async {
    var result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => Production.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Production> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Production.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateProduct(Production data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addProduct(Production data) async{
    var result  = await _api.addDocument(data.toJson()) ;
    return ;
  }
}
