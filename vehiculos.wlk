object bicicleta {
  method peso() = 5 
}
object camion {
  var acoplados=1
  method cantAcoplados(cant) {
    acoplados=cant
  } 
  method peso() {
    return  acoplados * 50
  } 
}