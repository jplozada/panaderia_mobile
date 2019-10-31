import 'package:flutter/material.dart';
import 'package:prueba1/core/models/productionModel.dart';
import 'package:provider/provider.dart';
import '../../../core/viewmodels/CRUDModelProduction.dart';
class AddProduction extends StatefulWidget {
  @override
  _AddProductionState createState() => _AddProductionState();
}

class _AddProductionState extends State<AddProduction> {
  final _formKey = GlobalKey<FormState>();
  String trabajo ;
  String cantidad ;
  String fecha ;

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    var productProvider = Provider.of<CRUDModelProduction>(context) ;
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir registro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Trabajo realizado',
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
                initialValue: "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
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
              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async{
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await productProvider.addProduct(Production(trabajo: trabajo, cantidad: cantidad, fecha: fecha));
                    Navigator.pushNamed(context, '/');
                  }
                },
                child: Text('add Product', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              )

            ],
          ),
        ),
      ),
    );
  }
}
