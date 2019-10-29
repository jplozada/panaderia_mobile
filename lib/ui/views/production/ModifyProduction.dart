import 'package:flutter/material.dart';
import 'package:prueba1/core/models/productionModel.dart';
import 'package:prueba1/core/viewmodels/CRUDModelProduction.dart';
import 'package:provider/provider.dart';


class ModifyProduction extends StatefulWidget {
  final Production product;

  ModifyProduction({@required this.product});

  @override
  _ModifyProductionState createState() => _ModifyProductionState();
}

class _ModifyProductionState extends State<ModifyProduction> {
  final _formKey = GlobalKey<FormState>();

  String trabajo ;

  String cantidad ;

  String fecha ;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelProduction>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Modificar Produccion'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  initialValue: widget.product.trabajo,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Trabajo Realizado',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese el trabajo realizado';
                    }
                  },
                  onSaved: (value) => trabajo = value
              ),
              SizedBox(height: 16,),
              TextFormField(
                  initialValue: widget.product.cantidad,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Cantidad',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese la cantidad';
                    }
                  },
                  onSaved: (value) => cantidad = value
              ),
              SizedBox(height: 16,),
              TextFormField(
                  initialValue: widget.product.fecha,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Fecha',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese la fecha';
                    }
                  },
                  onSaved: (value) => fecha = value
              ),
              SizedBox(height: 16,),
              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async{
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await productProvider.updateProduct(Production(trabajo: trabajo, cantidad: cantidad, fecha: fecha ),widget.product.id);
                    Navigator.pop(context) ;
                  }
                },
                child: Text('Modificar registro', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              )

            ],
          ),
        ),
      ),
    );
  }
}
