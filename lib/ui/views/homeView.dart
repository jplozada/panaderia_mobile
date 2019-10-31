import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:prueba1/ui/views/HomeProduction.dart';
import 'package:prueba1/ui/views/homeVentas.dart';
import 'package:prueba1/ui/views/inventory/readInventory.dart';

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  final TextEditingController email_controller = new TextEditingController();
  final TextEditingController password_controller = new TextEditingController();
  String _nombre;
  String _contr;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: true,
        body:
        new ListView(
          shrinkWrap: true,
          reverse: false,
          children: <Widget>[
            new SizedBox(height: 20.0,),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new SizedBox(height: 50.0,),

              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset(
                    'assets/keke.png',
                    height: 200.0,
                    width: 210.0,
                    fit: BoxFit.scaleDown,
                  )
                ],
              ),
              new Center(
                  child: new Center(
                    child: new Stack(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 30.0, right: 30.0),
                            child: new Form(
                              autovalidate: false,
                              child: new Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Padding(
                                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                    child: new TextFormField( 
                                      controller: email_controller,
                                      autofocus: false,

                                      decoration: new InputDecoration(
                                          labelText: "Nombre de Usuario",
                                          
                                          prefixIcon: Padding(padding: EdgeInsets.only(right: 7.0),child:new Image.asset(
                                            'assets/user_icon.png',
                                            height: 25.0,
                                            width: 25.0,
                                            fit: BoxFit.scaleDown,
                                            color: Color(0xFF772f1a),
                                          )),
                                          ),
                                      onChanged: (text) {
                                        _nombre = text;
                                        print(_nombre);
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                  new Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.0, right: 10.0, top: 5.0),
                                      child: new TextFormField(
                                        obscureText: true,
                                        autofocus: false,
                                        controller: password_controller,
                                        decoration: new InputDecoration(

                                            labelText: "Contraseña",

                                            prefixIcon: Padding(padding: EdgeInsets.only(right: 7.0),child: new Image.asset(
                                              'assets/password_icon.png',
                                              height: 25.0,
                                              width: 25.0,
                                              fit: BoxFit.scaleDown,
                                              color: Color(0xFF772f1a),
                                            ))),
                                        onChanged: (text) {
                                          _contr = text;
                                          print(_contr);
                                        },
                                        keyboardType: TextInputType.text,
                                      )),
                                  new Padding(
                                    padding: EdgeInsets.only(
                                        left: 0.0, top: 45.0, bottom: 20.0),
                                    child: new RaisedButton(
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                          new BorderRadius.circular(30.0)),
                                      onPressed: () {
                                        if (!(email_controller.value.text
                                            .trim()
                                            .toString()
                                            .length >
                                            1)) {
                                          Fluttertoast.showToast(
                                              msg: "Ingrese Nombre de Usuario.",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIos: 1);
                                        } else if (!(password_controller.value.text
                                            .trim()
                                            .toString()
                                            .length >
                                            1)) {
                                          Fluttertoast.showToast(
                                              msg: "Ingrese la contraseña.",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIos: 1);
                                        } else {
                                          if (_nombre == "1" &&
                                              _contr == "1") {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ReadInventory()
                                              ),
                                            );
                                          }
                                          else {
                                            if (_nombre == "2" &&
                                                _contr == "2") {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeProduction()
                                                ),
                                              );
                                            }
                                            else {
                                              if (_nombre == "3" &&
                                                  _contr == "3") {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomeVentas()
                                                  ),
                                                );
                                              }
                                              else {
                                                Fluttertoast.showToast(
                                                    msg: "No existe ese usuario",
                                                    toastLength: Toast
                                                        .LENGTH_SHORT,
                                                    gravity: ToastGravity
                                                        .CENTER,
                                                    timeInSecForIos: 1);
                                              }
                                            }
                                          }
                                        }

                                      },
                                      child: new Text(
                                        "Login",
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      color: Color(0xFFf2a65a),
                                      textColor: Colors.white,
                                      elevation: 5.0,
                                      padding: EdgeInsets.only(
                                          left: 80.0,
                                          right: 80.0,
                                          top: 15.0,
                                          bottom: 15.0),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ))
            ],
          )

        ],)
       );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed

    super.dispose();
    email_controller.dispose();
    password_controller.dispose();
  }
}
