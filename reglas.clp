(defrule crearSesion ;; Esta regla inicializa la sesión, saluda y explica las reglas
  (not(object (is-a SESION) (nombreJuego ?juego) (nombreBambino ?bam))) ;; DUDA: se hace así que no haya una instancia de sesión???
  (object (is-a JUEGO)(nombre ?juego))
  (object (is-a BAMBINO)(nombre ?bam)(saludo ?salBambino)(personalidad ?pers))
  (object (is-a LISTAPERSONALIDADES) (adaptadoA ?pers) (saludo ?sal)(reglas ?r))
    =>
    ;;Inicializar sesión
    (make-instance of SESION (nombreJuego ?juego)(nombreBambino ?bam)) ;; Creamos la instancia sesión para consultar en el resto de reglas
    ;;Saludo
    (printout  "¡Hola, " ?bam "!," ?sal  crlf)
    (printout ?salBambino)
    ;;Reglas
    (printout  "Te cuento las reglas:" crlf ?r crlf)
    (printout "¡Entendido!" crlf)
    ;;Creamos el turno y cambiamos la fase
    (make-instance of TURNO (fase tirada)(jugador robot)) ;; Creamos la instancia sesión para consultar en el resto de reglas
)


(defrule TiradaDado
  ;;Condiciones necesarias
  (object (is-a SESION) (nombreJuego ?juego) (nombreBambino ?bam)) ;; Que exista una sesión
  ?turno <- (object (is-a TURNO) (fase tirada)) ;; Que la fase de juego sea tirar dado/piedra
  ;;Instancias necesarias para la tirada
  (object (is-a DADO) (valorDado ?dado))
  =>
  (modify-instance ?turno (valorDado ?dado)(fase movimiento)) ;; Cambiamos el valor del dado escogido y la fase de juego
)

(defrule CasillaNormalOca
  ;;Condiciones necesarias
  (object (is-a SESION) (nombreJuego ?juego) (nombreBambino ?bam)) ;; Que exista una sesión
  ?turno <- (object (is-a TURNO)(valorDado ?dado)(fase movimiento)) ;; Que la fase de juego sea tirar dado/piedra
  ;;Instancias necesarias
  ?jugador <- (is-a JUGADOR)(posicion ?posJug)
  ?casilla <- (is-a CASILLA)(nombreJuego ?juego)(tipo normal)(posicion ?posCas);;Tenemos que comprobar que esto sea la casilla del jugador _____________________________________
  ;;Sumamos el avance del dado
  (modify-instance ?jugador (posicion (+ ?posJug ?dado)))
  (modify-instance ?turno (fase cambioTurno))
)










;; Inspiración y formato BORRAR
  ; (defrule r-ACTIVIDAD-2
  ; (object (is-a A-2-ENTRADA) (entrada ?e) (salida ?sal) (recurso ?r) (entrada-2 ?e2) (duracion ?d))
  ; (object (is-a RECURSO) (nombre ?r) (estado on))
  ; ?pr1<- (object (is-a PRODUCTO) (nombre ?e))
  ; ?pr2<- (object (is-a PRODUCTO) (nombre ?e2))
  ; ?dur <- (tiempo ?t)
  ; =>
  ; (retract ?dur)
  ; (assert (tiempo (+ ?t ?d)))
  ; (unmake-instance ?pr1 ?pr2)
  ; (make-instance of PRODUCTO-ELABORADO (nombre ?sal))
  ; (printout t "Los productos " ?e ", " ?e2 " se transforman en " ?sal crlf)
  ; (printout t "El proceso lleva " (+ ?t ?d) " horas" crlf))