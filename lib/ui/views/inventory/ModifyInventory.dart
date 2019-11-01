import 'package:flutter/material.dart';
import 'package:prueba1/core/models/inventoryModel.dart';
import 'package:prueba1/core/viewmodels/CRUDModelInventory.dart';
import 'package:provider/provider.dart';


class ModifyInventory extends StatefulWidget {
  final Inventory product;

  ModifyInventory({@required this.product});

  @override
  _ModifyInventoryState createState() => _ModifyInventoryState();
}

class _ModifyInventoryState extends State<ModifyInventory> {
  final _formKey = GlobalKey<FormState>();

  String nombre ;
  String cantTotal ;
  String cantSalida ;
  String cantEntrada ;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelInventory>(context);
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
                  Text("Modificar Trabajo Realizado"),
                ],
              ),),
              SizedBox(height: 16,),
              TextFormField(
                  initialValue: widget.product.nombre,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Inventory Title',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Inventory Title';
                    }
                  },
                  onSaved: (value) => nombre = value
              ),
              SizedBox(height: 16,),
              Container(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Modificar Trabajo Realizado"),
                ],
              ),),
              SizedBox(height: 16,),
              TextFormField(
                  initialValue: widget.product.cantTotal.toString(),
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Price',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter The price';
                    }
                  },
                  onSaved: (value) => cantTotal = value
              ),
              SizedBox(height: 16,),
              Container(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Modificar Trabajo Realizado"),
                ],
              ),),
              SizedBox(height: 16,),
              TextFormField(
                  initialValue: widget.product.cantSalida.toString(),
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Price',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter The price';
                    }
                  },
                  onSaved: (value) => cantSalida = value
              ),
              SizedBox(height: 16,),
              Container(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Modificar Trabajo Realizado"),
                ],
              ),),
              SizedBox(height: 16,),
              TextFormField(
                  initialValue: widget.product.cantEntrada.toString(),
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Price',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter The price';
                    }
                  },
                  onSaved: (value) => cantEntrada = value
              ),              
              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async{
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await productProvider.updateProduct(Inventory(nombre: nombre, cantTotal: int.parse(cantTotal), cantSalida: int.parse(cantSalida), cantEntrada: int.parse(cantEntrada) ),widget.product.id);
                    Navigator.pushNamed(context, '/readInventory');
                  }
                },
                child: Text('Modify Inventory', style: TextStyle(color: Colors.white)),
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
