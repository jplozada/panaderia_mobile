import 'package:flutter/material.dart';
import 'package:prueba1/core/models/salesModel.dart';
import 'package:provider/provider.dart';
import '../../../core/viewmodels/CRUDModelSales.dart';

class AddSales extends StatefulWidget {
  @override
  _AddSalesState createState() => _AddSalesState();
}

class _AddSalesState extends State<AddSales> {
  final _formKey = GlobalKey<FormState>();

  String fechaVenta ;
  String prodVenta ;
  String cantRecibida ;
  String cantVendida ;

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    var productProvider = Provider.of<CRUDModelSales>(context) ;
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
              SizedBox(height: 16,),
              TextFormField(
                initialValue: "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Fecha de venta',
                  fillColor: Colors.grey[300],
                  filled: true,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Introduzca la fecha de venta';
                  }
                },
                  onSaved: (value) => fechaVenta = value
              ),
              SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Producto en venta',
                  fillColor: Colors.grey[300],
                  filled: true,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Introduzca el producto en venta';
                  }
                },
                  onSaved: (value) => prodVenta = value
              ),
              SizedBox(height: 16,),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Cantidad Recibida',
                  fillColor: Colors.grey[300],
                  filled: true,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Introduzca la cantidad recibida';
                  }
                },
                  onSaved: (value) => cantRecibida = value
              ),
              SizedBox(height: 16,),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Cantidad Vendida',
                  fillColor: Colors.grey[300],
                  filled: true,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Introduzca la cantidad de vendida';
                  }
                },
                  onSaved: (value) => cantVendida = value
              ),
              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async{
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await productProvider.addProduct(Sales(fechaVenta: fechaVenta, prodVenta: prodVenta, cantRecibida: int.parse(cantRecibida), cantVendida: int.parse(cantVendida)));
                    Navigator.pushNamed(context, '/readSales');
                  }
                },
                child: Text('Añadir registro', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              )

            ],
          ),
        ),
      ),
    );
  }
}
