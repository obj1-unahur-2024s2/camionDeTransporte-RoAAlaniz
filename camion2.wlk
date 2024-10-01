object camion {
    const property carga = []
    const tara = 1000
    method cargarCosa(unaCosa) {
        carga.add(unaCosa)
        unaCosa.consecuenciasDeCarga()
    }
    method descargar(unaCosa) = carga.remove(unaCosa)
    method cargarVariasCosas(listaCosas) {
        carga.addAll(listaCosas) 
        listaCosas.forEach({c => c.consecuenciasDeCarga()})
    } 
    method pesoTotal() = 1000 + self.pesoDeLaCarga().sum()
    method pesoDeLaCarga() = carga.map({c => c.peso()}) 
    method todosPesosImpares() = self.pesoDeLaCarga().all({e => e.odd()})
    method algoPesa(unValor) = carga.any({c => c.peso() == unValor})
    method algoPesaBis(unValor) = self.pesoDeLaCarga().any({p => p == unValor})
    method cosaConPeligrosidad(nivel) {
        carga.find({c => c.peligrosidad() == nivel})
    } 
    method cosasSuperanPeligrosidad(nivel) {
        carga.filter({c => c.peligrosidad() > nivel})
    }
    method cosasMasPeligrosasQue(unaCosa) {
        carga.filter({c => c.peligrosidad() >unaCosa.peligrosidad()})
    }
    method excedidoMaximoPeso() {
        self.pesoTotal() > 2500
    }
    method puedeCircularEnRuta(unValor) {
        !self.excedidoMaximoPeso() && carga.any({c => c.peligrosidad() > unValor})
    }
    method tieneCosaQuePesaEntre(min, max) {
        carga.any({c => c.peso().between(min, max)})
        //carga.any({c => c.peso() >= min and c.peso() <= max})
    }
    method cosaMasPesada() = carga.max({c => c.peso()}) //maximo valor de peso
}