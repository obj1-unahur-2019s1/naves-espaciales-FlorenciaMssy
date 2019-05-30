 class NaveEspacial {
	var velocidad = 0
	var direccion = 0	
	var combustible = 0
	
	method velocidad(cuanto) { velocidad = cuanto }
	method acelerar(cuanto) { velocidad = (velocidad + cuanto).min(100000) }
	method desacelerar(cuanto) { (velocidad -= cuanto).max(0)}
	
	method irHaciaElSol() { direccion = 10 }
	method escaparDelSol() { direccion = -10 }
	method ponerseParaleloAlSol() { direccion = 0 }
	
	method acercarseUnPocoAlSol() { direccion += 1 }
	method alejarseUnPocoDelSol() { direccion -= 1 }
	
	method prepararViaje() {combustible = combustible + 3000; self.acelerar(5000)}
	method cargarCombustible(cantidad) {combustible = combustible + cantidad}
	method descargarCombustible(cantidad) {combustible = combustible - cantidad}
	
	method escapar(){}
	method avisar(){}
	method recibirAmenaza(){self.escapar()self.avisar()}
	method estaTranquila(){return combustible >= 4000 && velocidad <= 1200}
	
}
class NaveBaliza inherits NaveEspacial{
	var colorDeBaliza
	
method cambiarColorDeBaliza(colorNuevo){
	 colorDeBaliza = colorNuevo
}
override method prepararViaje(){
	super()
	self.cambiarColorDeBaliza("verde")
	self.ponerseParaleloAlSol()
}
override method escapar(){
	self.irHaciaElSol()
}
override method avisar(){
	self.cambiarColorDeBaliza("rojo")
}
override method estaTranquila(){
	return super() && colorDeBaliza != "rojo"
}
}

class NavePasajeros inherits NaveEspacial {
	
	var property pasajeros = 20
	var property racionComida = 0
	var property racionBebida = 0
	
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
override method prepararViaje(){
	super()
	self.cargarBebida(6 * pasajeros) 
	self.cargarComida(4 * pasajeros) 
	self.acercarseUnPocoAlSol()
}
override method escapar(){
	self.velocidad(velocidad*2)
}
override method avisar(){
	self.descargarComida(pasajeros)
	self.descargarBebida(pasajeros*2)
}
}

class NaveCombate inherits NaveEspacial{
	var property naveVisible = true
	var property misilesDesplegados = false
	var property mensajes = []
	
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
method primerMensajeEmitido(){
	return mensajes.first()
}
method ultimoMensajeEmitido(){
	return mensajes.last()
}
method esEscueta(){
	return not mensajes.any({m => m.size()>=30})
}
method emitioMensaje(mensaje){
	return mensajes.contains(mensaje)
}
override method prepararViaje(){
	super()
	self.ponerVisible()
	self.replegarMisiles()
	self.acelerar(1500)
	self.emitirMensaje("Saliendo en mision")
}
override method escapar(){
	self.escaparDelSol()
	self.escaparDelSol()
}
override method avisar(){
	self.emitirMensaje("Amenaza recibida")
}
override method estaTranquila(){
	return super()&& misilesDesplegados
}
}

class NaveHospital inherits NavePasajeros{
	var property quirofanosPreparados = true
	
override method recibirAmenaza(){
	super()
	quirofanosPreparados = true
}
override method estaTranquila(){
	return super() && not quirofanosPreparados
}
}

class NaveCombateSigilosa inherits NaveCombate{
	
override method escapar(){
	super()
	self.desplegarMisiles()
	self.ponerInvisible()		
}
override method estaTranquila(){
	return super() && naveVisible
}
}