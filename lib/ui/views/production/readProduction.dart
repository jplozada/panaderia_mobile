import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prueba1/core/models/productionModel.dart';
import 'package:prueba1/core/viewmodels/CRUDModelProduction.dart';
import 'package:prueba1/ui/widgets/productionCard.dart';
import 'package:provider/provider.dart';

class ReadProduction extends StatefulWidget {
  @override
  _ReadProductionState createState() => _ReadProductionState();
}

class _ReadProductionState extends State<ReadProduction> {
  List<Production> products;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelProduction>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addProduction');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Produccion'),
      ),
      body: Container(
        child: StreamBuilder(
            stream: productProvider.fetchProductsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                products = snapshot.data.documents
                    .map((doc) => Production.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (buildContext, index) =>
                      ProductionCard(product: products[index]),
                );
              } else {
                return Center(child: Text('Cargando datos...'),);
              }
            }),
      ),
    );
  }
}
