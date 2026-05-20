import destinos.*
object paquete {
  var destino= matrix
  var estaPago= true
  method agregarDestino(unaDestino) {
    destino=unaDestino
  }
  method estaPagado(condicion) { //Metodo que modifica la condicion de esta pagado
    estaPago=condicion
  }
  method estaPago() = estaPago //Metodo que indica la condicion actual del paquete

  method puedeEntregarseCon(unMensajero){
    return self.estaPago() && destino.puedePasar(unMensajero)
  }
  method precioTotal() = 50 
}
object paquetito {
  var destino= matrix 
  method agregarDestino(unDestino) {
    destino=unDestino
  }
  method estaPagado(condicion)=true
  method puedeEntregarseCon(unMensajero)= true
  method precioTotal() =  0
}
object paquetonViajero {
  const conjuntoDestinos = #{}
  var montoAbonado=0
  method agregarDestino(unDestino) {
    conjuntoDestinos.add(unDestino)
  }
  method precioPorDestino()=100
  method precioTotal() = self.precioPorDestino() * self.cantidadDeDestinos()
  method cantidadDeDestinos() = conjuntoDestinos.size()  
  
  method estaPago() = montoAbonado>=self.precioTotal()
  method pagarCon(monto) {
    montoAbonado+=monto
  }
  method puedeEntregarseCon(unMensajero){
    return self.estaPago() && self.mensajeroPuedeEntregarAtodosLosDestinos(unMensajero)
  }
  method mensajeroPuedeEntregarAtodosLosDestinos(unMensajero){
   return conjuntoDestinos.all({destino => destino.puedePasar(unMensajero)}) //True si pude entregar a TODOS los destinos, sino es false
  }
}
