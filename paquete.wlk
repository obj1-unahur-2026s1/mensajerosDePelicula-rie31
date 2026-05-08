import destinos.*
object paquete {
  var destino= matrix
  method destino(unaDestino) {
    destino=unaDestino
  }
  var estaPago= true
  method estaPagado(condicion) { 
    estaPago=condicion
  }
  method puedeEntregarseCon(unMensajero){
    return estaPago && destino.puedePasar(unMensajero)
  }
}