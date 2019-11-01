import 'package:flutter/material.dart';
import 'package:prueba1/core/models/salesModel.dart';
import 'package:prueba1/ui/views/sales/ModifySales.dart';
import 'package:prueba1/core/viewmodels/CRUDModelSales.dart';
import 'package:provider/provider.dart';

class SalesCard extends StatelessWidget {
  final Sales product;

  SalesCard({@required this.product});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelSales>(context);

    return Padding(
        padding: EdgeInsets.all(5),
        child: Card(
          elevation: 5,
          child: Container(
            // height: MediaQuery
            //     .of(context)
            //     .size
            //     .height * 0.18,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.9,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(14),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  product.fechaVenta,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  product.prodVenta,
                                    style: TextStyle(
                                      fontSize: 16,),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  product.cantRecibida.toString(),
                                    style: TextStyle(
                                      fontSize: 16,),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  product.cantVendida.toString(),
                                    style: TextStyle(
                                      fontSize: 16,),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                          iconSize: 35,
                          icon: Icon(Icons.delete_forever),
                          onPressed: () {
                            productProvider.removeProduct(product.id);
                            Navigator.pushNamed(context, '/readSales');
                          },
                        ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                          iconSize: 35,
                          icon: Icon(Icons.edit),
                          onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_)=> ModifySales(product: product,)));
                            },
                        ),
                        ),
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      );
  }
}
