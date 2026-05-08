import mensajeros.*

object puenteDeBrooklyn {
  method dejarPasarMensajero() {
    
  }
  method puedePasar(mensajero) = mensajero.peso() <= 1000 //1 tonelada = 1000 kg
}
object matrix {
  method puedePasar(mensajero) = mensajero.puedeLlamar() 
}