 class NaveEspacial {
	var velocidad = 0
	var direccion = 0	
	
	method velocidad(cuanto) { velocidad = cuanto }
	method acelerar(cuanto) { velocidad = (velocidad + cuanto).min(100000) }
	method desacelerar(cuanto) { velocidad -= cuanto }
	
	method irHaciaElSol() { direccion = 10 }
	method escaparDelSol() { direccion = -10 }
	method ponerseParaleloAlSol() { direccion = 0 }
	
	method acercarseUnPocoAlSol() { direccion += 1 }
	method alejarseUnPocoDelSol() { direccion -= 1 }
}
class NaveBaliza inherits NaveEspacial{
	
method cambiarColorDeBaliza(color){
	 return color
}
}

class NavePasajeros inherits NaveEspacial {
	
	var property pasajeros = 20
	var property racionComida
	var property racionBebida
	
method cargarComida(cantidad){
	racionComida = racionComida + cantidad
}
method descargarComida(cantidad){
	racionComida = racionComida - cantidad
}
method cargarBebida(cantidad){
	racionBebida = racionBebida + cantidad
	
}
method descargarBebida(cantidad){
	racionBebida = racionBebida - cantidad
}
}

class NaveCombate{
	var property naveVisible
	var property misilesDesplegados
	var mensajes = []
	
method ponerVisible(){
	naveVisible = true
}
method ponerInvisible(){
	naveVisible = false
}
method estaInvisible(){
	return not naveVisible
}
method desplegarMisiles(){
	misilesDesplegados = true
}
method replegarMisiles(){
	misilesDesplegados = false
}
method misilesDesplegados(){
	return misilesDesplegados
}
method emitirMensaje(mensaje){
	mensajes.add(mensaje)
}
method mensajesEmitidos(){
	return mensajes
}
}
