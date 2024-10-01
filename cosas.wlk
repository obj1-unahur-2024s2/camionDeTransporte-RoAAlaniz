object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}

object bumblebee {
    var modoAuto = true
    method peso() = 800
    method peligrosidad() =  if (modoAuto) 15 else 30
    method transformarEnAuto() {modoAuto = true}
    method transformarseEnRobot() {modoAuto = false}
    method estaEnModoAuto() = modoAuto
    // ò puede ser = modoAuto = !modoAuto
}

object ladrillo {
    var property cantidad = 0
    method peso() = cantidad * 2
    method peligrosidad() = 2
}

object arena {
    var property peso = 0
    method peligrosidad() = 1 
}

object bateriaAntiaerea {
    var property estaConMisiles = false
    method peso() = if (estaConMisiles) 300 else 200
    method peligrosidad() = if (estaConMisiles) 100 else 0
}

 object contenedor {
    const cosas = []
    method sacarCosa(unaCosa) = cosas.remove(unaCosa)
    method ponerCosa(unaCosa) = cosas.add(unaCosa)
    method agregarVariasCosas(listaCosas) = cosas.addAll(listaCosas)
    method peso() = 100 + cosas.sum({c => c.peso()})
    method peligrosidad() = if (cosas.isEmpty()) 0 else cosas.max({c => c.peligrosidad()}).peligrosidad()
                                                                    //obj mas peligroso   //peligrosidad(nro)  == esto retorna la peligrosidad de aquel obj peligroso
    
 } 

 object residuoRadioactivo {
    var property peso = 0
    method peligrosidad() = 200
 }

  object embalajeSeguridad {
    var property cosaEnvuelta = arena
    method peso() = cosaEnvuelta.peso()
    method peligrosidad() = cosaEnvuelta.peligrosidad() * 0.5
  }