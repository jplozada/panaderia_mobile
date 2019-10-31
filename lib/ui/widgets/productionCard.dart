import 'package:flutter/material.dart';
import 'package:prueba1/core/models/productionModel.dart';
import 'package:prueba1/ui/views/production/modifyProduction.dart';
import 'package:prueba1/core/viewmodels/CRUDModelProduction.dart';
import 'package:provider/provider.dart';

class ProductionCard extends StatelessWidget {
  final Production product;

  ProductionCard({@required this.product});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelProduction>(context);
    return Padding(
        padding: EdgeInsets.all(8),
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
                  padding: EdgeInsets.all(16),
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
                                  product.trabajo,
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
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  product.cantidad,
                                    style: TextStyle(
                                      fontSize: 16,),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  product.fecha,
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
                            Navigator.pushNamed(context, '/');
                          },
                        ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                          iconSize: 35,
                          icon: Icon(Icons.edit),
                          onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_)=> ModifyProduction(product: product,)));
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

