import vehiculos.*

object roberto {
  var vehiculo= bicicleta //Bicicleta o camion
  var pesoMensajero= 100
  method pesoMensajero(unPeso) {
    pesoMensajero=unPeso
  }
  method vehiculo(unVehiculo) {
    vehiculo=unVehiculo
  }
  method pesoTotal() {
    return pesoMensajero + vehiculo.peso()
  }
  method puedeLlamar() = false
}
object chuckNorris {
  method pesoTotal() = 80
  method puedeLlamar() = true  
}
object neo {
  var tieneCredito=true
  method credito(condicion) {
    tieneCredito=condicion
  }
  method pesoTotal() = 0
  method puedeLlamar() = tieneCredito
}
