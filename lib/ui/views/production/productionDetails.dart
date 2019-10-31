// import 'package:flutter/material.dart';
// import 'package:prueba1/core/models/productionModel.dart';
// import 'package:prueba1/core/viewmodels/CRUDModelProduction.dart';
// import 'package:prueba1/ui/views/Production/ModifyProduction.dart';
// import 'package:provider/provider.dart';

// class ProductionDetails extends StatelessWidget {
//   final Production product;

//   ProductionDetails({@required this.product});

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = Provider.of<CRUDModelProduction>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detalle del registro'),
//         actions: <Widget>[
          
//           IconButton(
//             iconSize: 35,
//             icon: Icon(Icons.delete_forever),
//             onPressed: ()async {
//               await productProvider.removeProduct(product.id);
//               Navigator.pushNamed(context, '/readProduction');
//             },
//           ),
//           IconButton(
//             iconSize: 35,
//             icon: Icon(Icons.edit),
//             onPressed: (){
//               Navigator.push(context, MaterialPageRoute(builder: (_)=> ModifyProduction(product: product,)));
//             },
//           )
//         ],
//       ),
//       body: Column(
//         mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             product.trabajo,
//             style: TextStyle(
//                 fontWeight: FontWeight.w900,
//                 fontSize: 22,
//                 fontStyle: FontStyle.italic),
//           ),
//           Text(
//             product.cantidad,
//             style: TextStyle(
//                 fontWeight: FontWeight.w900,
//                 fontSize: 22,
//                 fontStyle: FontStyle.italic),
//           ),
//           Text(
//             product.fecha,
//             style: TextStyle(
//                 fontWeight: FontWeight.w900,
//                 fontSize: 22,
//                 fontStyle: FontStyle.italic),
//           ),
//         ],
//       ),
//     );
//   }
// }
