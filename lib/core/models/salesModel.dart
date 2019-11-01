
class Sales {
  String id;
  String fechaVenta;
  String prodVenta;
  int cantRecibida;
  int cantVendida;

  Sales({this.id, this.fechaVenta, this.prodVenta,this.cantRecibida,this.cantVendida});

  Sales.fromMap(Map snapshot,String id) :
        id = id ?? '',
        fechaVenta = snapshot['fechaVenta'] ?? '',
        prodVenta = snapshot['prodVenta'] ?? '',
        cantRecibida = snapshot['cantRecibida'] ?? '',
        cantVendida = snapshot['cantVendida'] ?? '';

  toJson() {
    return {
      "fechaVenta": fechaVenta,
      "prodVenta": prodVenta,
      "cantRecibida": cantRecibida,
      "cantVendida": cantVendida,
    };
  }
}