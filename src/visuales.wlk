import factories.*
import nivel.*

import wollok.game.*
import elementos.*
import score.*

object tanke inherits Visual(image = "tanke.png",position = new Position(x=1,y=1)){

	var property monedas = 0
	var property tieneEspatula = false

	method sumaMonedas(cantidad) { monedas += cantidad }

	method restaMonedas(cantidad) {
		if (cantidad > monedas)
			throw new Exception(message = "No tengo suficiente monedas para eso")
		monedas -= cantidad
	}
	
	method agarrarIngrediente(ingrediente){
		self.sumaMonedas(ingrediente.monedas())
	}

	method canta() {
		game.say(self, "Vivo en una piña debajo del mar")
	}
	
	method cuantasMonedas(){
		game.say(self, "Tengo " + self.monedas() + " monedas!!")
	}
	
	method disparar(x,y){
       game.say(self,"PIUM")
       proyectil.crear(x,y)
    }

}

object proyectil inherits Visual(position = new Position(x=10,y=3), image = "bala.png"){
	method crear(x,y){
		game.addVisual(bala)
		nivel.ubicarAleatoriamente(self)
       
	}
	
	
   
}


//Fondos del juego de las distintas pantallas

object fondoDelJuego inherits Visual(
	image = "arg.PNG",
	position = new Position(x=1,y=1)
){
	method colisionadoPor(visual){}
}
const inicioDelJuego = new Visual(
	image =  "copa.png",
	position = game.at(1,1)
)
const bobAlCostado = new Visual(
	image = "PruebaInstrucciones.png",
	position = game.at(19,1)
)
const winVisual = new Visual(
	image = "winwin.png",
	position = game.origin()
)
const empleadoDelMes = new Visual(
	image = "empleadoDelMes.png",
	position = game.at(20,0)
)
const costadoPlankton = new Visual(
	image = "planktonALCostado.png",
	position = game.at(22,1)
)
const gameOver = new Visual(
	image = "sadBob.gif", 
	position = game.at(1,1)
)

class Visual {
	var property image
	var property position = game.origin()
}


object win{
	
	method actualizarScoreTotal(){
		if (plankton.score()>= 3)
			nivel.gameOver()
		else{ 
			if(kangreburger.score() >= 2)
				nivel.hasGanado()
			else 
				score.dibujar()
		}
	}
}




