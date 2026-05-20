import mensajeros.*
import paquete.*
object mensajeria {
    const empleados= #{} //Elijo conJunto para que no se repitan los mensajeros
    const paquetesAEnviar= #{}
    const paquetesPendientes= #{}
    var valorPaqueteEnviado=0 

    method paquetesPendientes() = paquetesPendientes 
    method paquetesActuales() = paquetesAEnviar 
    method mostrarMensajeros() = empleados

    method contratarA(mensajero) {
      empleados.add(mensajero)
    }
    method despedirA(mensajero) {
      if(self.existeMensajero(mensajero))
      empleados.remove(mensajero)
    }
    method existeMensajero(mensajero) {
      return empleados.contains(mensajero)
    }
    method despedirALosMensajeros() {
      empleados.clear()
    }

    method esMensajeriaGrande() = empleados.size()>2 

    method entregaElPrimerEmpleado(unPaquete) = unPaquete.puedeEntregarseCon(self.primerMensajero()) 

    method primerMensajero()= empleados.asList().first() //Convierto el conjunto en una lista y devuelvo el primero

    method pesoDelUltimoMensajero() = self.ultimoMensajero().pesoTotal()
    method ultimoMensajero() = empleados.asList().last() //Convierto a lista y devuelvo el ultimo empleado
    
//TERCERA PARTE: MENSAJERIA RECARGADA

    method puedeSerEntregadoPorAlgunMensajero(unPaquete) =  empleados.any({mensajero=> unPaquete.puedeEntregarseCon(mensajero)}) 
    method mensajerosQuePuedenLlevar(unPaquete) = empleados.filter({empleado=> unPaquete.puedeEntregarseCon(empleado)})
    
    method mensajeriaTieneSobrepeso() = self.pesoTotalDeMensajeria() > 500
    method pesoTotalDeMensajeria() = empleados.sum({empleado=> empleado.pesoTotal()}) 

    method enviarPaquete(unPaquete) {
      if(self.existePaquete(unPaquete) && self.puedeSerEntregadoPorAlgunMensajero(unPaquete)){
          valorPaqueteEnviado+= unPaquete.precioTotal() //Guarda el valor del paquete antes de enviarlo, luego lo elimina de la lista 
          self.enviarElPaquete(unPaquete)
      }
      else{
          self.agregarAPaquetesPendientes(unPaquete)
          paquetesAEnviar.remove(unPaquete)
      } 
    } 
    
    method facturacion() = valorPaqueteEnviado

    method enviarElPaquete(unPaquete) {
      paquetesAEnviar.remove(unPaquete)
    }
    method agregarAPaquetesPendientes(unPaquete) {
      paquetesPendientes.add(unPaquete)
    }
    method agregarAPaquetesAEnviar(unPaquete) {
      paquetesAEnviar.add(unPaquete)
    }
    method existePaquete(unPaquete) = paquetesAEnviar.contains(unPaquete)
    method enviarTodosLosPaquetesDe(paquetes) {
      paquetes.forEach({paquete=> self.enviarPaquete(paquete)})
    }
    method paquetePendienteMasCaro() = paquetesPendientes.max({paquete=>paquete.precioTotal()}) 

}
