
class Production {
  String id;
  String trabajo;
  String cantidad;
  String fecha;

  Production({this.id, this.trabajo, this.cantidad,this.fecha});

  Production.fromMap(Map snapshot,String id) :
        id = id ?? '',
        trabajo = snapshot['trabajo'] ?? '',
        cantidad = snapshot['cantidad'] ?? '',
        fecha = snapshot['fecha'] ?? '';

  toJson() {
    return {
      "trabajo": trabajo,
      "cantidad": cantidad,
      "fecha": fecha,
    };
  }
}