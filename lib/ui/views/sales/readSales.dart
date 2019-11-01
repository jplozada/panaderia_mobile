import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prueba1/core/models/salesModel.dart';
import 'package:prueba1/core/viewmodels/CRUDModelSales.dart';
import 'package:prueba1/ui/widgets/salesCard.dart';
import 'package:provider/provider.dart';

class ReadSales extends StatefulWidget {
  @override
  _ReadSalesState createState() => _ReadSalesState();
}

class _ReadSalesState extends State<ReadSales> {
  List<Sales> products;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelSales>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addSales');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Ventas'),
      ),
      body: Container(
        child: StreamBuilder(
            stream: productProvider.fetchProductsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                products = snapshot.data.documents
                    .map((doc) => Sales.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (buildContext, index) =>
                      SalesCard(product: products[index]),
                );
              } else {
                return Center(child: Text('Cargando datos...'),);
              }
            }),
      ),
    );
  }
}
