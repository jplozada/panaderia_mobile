
class Inventory {
  String id;
  String nombre;
  String cantTotal;
  String cantSalida;
  String cantEntrada;

  Inventory({this.id, this.nombre, this.cantTotal,this.cantSalida,this.cantEntrada});

  Inventory.fromMap(Map snapshot,String id) :
        id = id ?? '',
        nombre = snapshot['nombre'] ?? '',
        cantTotal = snapshot['cantTotal'] ?? '',
        cantSalida = snapshot['cantSalida'] ?? '',
        cantEntrada = snapshot['cantEntrada'] ?? '';

  toJson() {
    return {
      "nombre": nombre,
      "cantTotal": cantTotal,
      "cantSalida": cantSalida,
      "cantEntrada": cantEntrada,
    };
  }
}