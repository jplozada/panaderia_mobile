import 'package:flutter/material.dart';
import 'package:prueba1/core/models/salesModel.dart';
import 'package:prueba1/core/viewmodels/CRUDModelSales.dart';
import 'package:provider/provider.dart';


class ModifySales extends StatefulWidget {
  final Sales product;

  ModifySales({@required this.product});

  @override
  _ModifySalesState createState() => _ModifySalesState();
}

class _ModifySalesState extends State<ModifySales> {
  final _formKey = GlobalKey<FormState>();

  String fechaVenta ;
  String prodVenta ;
  String cantRecibida ;
  String cantVendida ;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelSales>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Modificar registro'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Fecha de Venta"),
                ],
              ),),
              SizedBox(height: 16,),
              TextFormField(
                  initialValue: widget.product.fechaVenta,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Fecha de venta Año/Mes/Dia',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese la fecha de venta';
                    }
                  },
                  onSaved: (value) => fechaVenta = value
              ),
              SizedBox(height: 16,),
              Container(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Producto en venta"),
                ],
              ),),
              SizedBox(height: 16,),
              TextFormField(
                  initialValue: widget.product.prodVenta.toString(),
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Producto en venta',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese el producto en venta';
                    }
                  },
                  onSaved: (value) => prodVenta = value
              ),
              SizedBox(height: 16,),
              Container(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Cantidad recibida"),
                ],
              ),),
              SizedBox(height: 16,),
              TextFormField(
                  initialValue: widget.product.cantRecibida.toString(),
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Cantidad recibida',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese la cantidad recibida';
                    }
                  },
                  onSaved: (value) => cantRecibida = value
              ),
              SizedBox(height: 16,),
              Container(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Cantidad vendida"),
                ],
              ),),
              SizedBox(height: 16,),
              TextFormField(
                  initialValue: widget.product.cantVendida.toString(),
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Cantidad vendida',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese la cantidad vendida';
                    }
                  },
                  onSaved: (value) => cantVendida = value
              ),              
              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async{
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await productProvider.updateProduct(Sales(fechaVenta: fechaVenta, prodVenta: prodVenta, cantRecibida: int.parse(cantRecibida), cantVendida: int.parse(cantVendida) ),widget.product.id);
                    Navigator.pushNamed(context, '/readSales');
                  }
                },
                child: Text('Modificar registro', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              )

            ],
          ),
        ),
      ),
      )
    );
  }
}
