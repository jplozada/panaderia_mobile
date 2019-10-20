import 'package:flutter/material.dart';
import 'package:prueba1/core/models/inventoryModel.dart';
import 'package:provider/provider.dart';
import '../../../core/viewmodels/CRUDModelInventory.dart';
class AddInventory extends StatefulWidget {
  @override
  _AddInventoryState createState() => _AddInventoryState();
}

class _AddInventoryState extends State<AddInventory> {
  final _formKey = GlobalKey<FormState>();
  String productType = 'Bag';
  String title ;
  String price ;

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<CRUDModelInventory>(context) ;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Add Inventory'),
        ),
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
                  hintText: 'Inventory Title',
                  fillColor: Colors.grey[300],
                  filled: true,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Inventory Title';
                  }
                },
                  onSaved: (value) => title = value
              ),
              SizedBox(height: 16,),
              TextFormField(
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
                  onSaved: (value) => price = value
              ),
              DropdownButton<String>(
                value: productType,
                onChanged: (String newValue) {
                  setState(() {
                    productType = newValue;
                  });
                },
                items: <String>['Bag', 'Computer', 'Dress', 'Phone','Shoes']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async{
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await productProvider.addProduct(Inventory(name: title,price: price,img: productType.toLowerCase()));
                    Navigator.pop(context) ;
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
