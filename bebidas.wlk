object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}

//nuevas bebidas

object licuadoDeFrutas {
  const ingredientes = []

  method rendimientoQueOtorga(dosisConsumida) {
    return self.sumaDeLosNutrientes() / dosisConsumida
  }
  method agregarIngrediente(unIngrediente) {
    return ingredientes.add(unIngrediente)
  }
  method sumaDeLosNutrientes() {
    return ingredientes.sum({i=>i.nutrientes()})
  }
}

object aguaSaborizada {
  var bebidaActual = cianuro

  method rendimientoQueOtorga(dosisConsumida) {
    return 1 + bebidaActual.rendimientoQueOtorga(dosisConsumida/4)
  }
  method cambiarBebida(unaBebida) {
    bebidaActual = unaBebida
  }
}

object coctel {
  const bebidas = []

  method rendimientoQueOtorga(dosisConsumida) {
    return 
  }
  method rendimientosDeBebidasEnElCoctel(dosisConsumida) {
    return bebidas.map({b=>b.rendimientoQueOtorga(dosisConsumida)})
  }
  method agregarBebida(unaBebida) {
    return bebidas.add(unaBebida)
  }
  method quitarBebida(unaBebida) {
    return bebidas.remove(unaBebida)
  }
}