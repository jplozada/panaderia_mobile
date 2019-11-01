import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../services/api.dart';
import '../models/salesModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModelSales extends ChangeNotifier {
  ApiSales _api = locator<ApiSales>();

  List<Sales> products;


  Future<List<Sales>> fetchProducts() async {
    var result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => Sales.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Sales> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Sales.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateProduct(Sales data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addProduct(Sales data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}
