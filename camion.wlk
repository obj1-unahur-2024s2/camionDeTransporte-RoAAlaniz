object camion {
    const property carga = []
    const tara = 1000
    method cargarCosa(unaCosa) = carga.add(unaCosa)
    method descargar(unaCosa) = carga.remove(unaCosa)
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
    method puedeCircularEnRuta(unValor) = !self.excedidoMaximoPeso() && carga.any({c => c.peligrosidad() > unValor})
    
}