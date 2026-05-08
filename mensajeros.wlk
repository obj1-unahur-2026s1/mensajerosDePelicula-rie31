import vehiculos.*

object roberto {
  var vehiculo= camion //Bicicleta o camion
  var pesoMensajero= 100
  method pesoMensajero(unPeso) {
    pesoMensajero=unPeso
  }
  method vehiculo(unVehiculo) {
    vehiculo=unVehiculo
  }
  method peso() {
    return pesoMensajero + vehiculo.peso()
  }
  method puedeLlamar() = false
}
object chuckNorris {
  method peso() = 80
  method puedeLlamar() = true  
}
object neo {
  var creditoDisponible=10
  method credito(monto) {
    creditoDisponible=monto
  }
  method peso() = 0
  method puedeLlamar() = creditoDisponible>0
}
