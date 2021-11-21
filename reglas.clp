(defrule crearSesion ;; Esta regla inicializa la sesión, saluda y explica las reglas
  (not(object (is-a SESION) (nombreJuego ?juego) (nombreBambino ?bam))) ;; DUDA: se hace así que no haya una instancia de sesión???
  (object (is-a JUEGO)(nombre ?juego))
  (object (is-a BAMBINO)(nombre ?bam)(saludo ?salBambino)(personalidad ?pers))
  ?elOtro <- (object(is-a BAMBINO))
  (object (is-a LISTAPERSONALIDADES)(juego ?juego)(adaptadoA ?pers)(saludo ?sal)(reglas ?r))
    =>
    ;;Inicializar sesión
    (make-instance of SESION (nombreJuego ?juego)(nombreBambino ?bam)) ;; Creamos la instancia sesión para consultar en el resto de reglas
    (printout t "----- Creando sesión de " ?juego " con " ?bam crlf)
    ;;Saludo
    (printout t "robot: ¡Hola, " ?bam "! " ?sal  crlf)
    (printout t ?bam ": " ?salBambino crlf)
    ;;Reglas
    (printout t "robot: Te cuento las reglas: " ?r crlf)
    (printout t ?bam ": ¡Entendido!" crlf)
    (printout t "robot: Venga, entonces empiezo yo, así ves como se juega" crlf)
    ;;Creamos el turno, cambiamos la fase y eliminamos la instancia del otro niño
    (send ?elOtro delete)
    (make-instance of TURNO (fase tirada)(jugador robot)) ;; Creamos la instancia sesión para consultar en el resto de reglas
    (make-instance of SIGUIENTETURNO(jugador1 robot)(jugador2 ?bam))
    (make-instance of SIGUIENTETURNO(jugador1 ?bam)(jugador2 robot))
)
(defrule CambiarTurno
  ;; Conciciones necesarias
  (object (is-a SESION) (nombreJuego ?juego) (nombreBambino ?bam)) ;; Que exista una sesión
  ?turno <- (object (is-a TURNO) (fase cambioTurno)(jugador ?jug)) ;; Que el turno esté en fase cambio de turno
  ;; Instancias necesarias
  (object (is-a SIGUIENTETURNO)(jugador1 ?jug) (jugador2 ?jug1)) ;; Que haya un hecho que determine el siguiente turno
  =>
  (printout t "Cambio de turno, ahora le toca a " ?jug1 crlf)
  (modify-instance ?turno (jugador ?jug1)(fase tirada)) ;; Modificamos el jugador en la fase deturno
)
(defrule TiradaDado
  ;;Condiciones necesarias
  (object (is-a SESION) (nombreJuego ?juego) (nombreBambino ?bam)) ;; Que exista una sesión
  ?turno <- (object (is-a TURNO) (fase tirada)(jugador ?nomJug)) ;; Que la fase de juego sea tirar dado/piedra
  ;;Instancias necesarias para la tirada
  (object (is-a DADO) (valorDado ?dado)(juego ?juego))
  ?rayuela <- (object (is-a JUEGO)(nombre rayuela)(maxCasillas ?piedraVuelta))
  =>
  (modify-instance ?rayuela (maxCasillas (- 18 ?dado))) ;; Guardamos el valor de la vuelta de la rayuela
  (modify-instance ?turno (valorDado ?dado)(fase movimiento)) ;; Cambiamos el valor del dado escogido y la fase de juego´
  (printout t ?nomJug ": He sacado un " ?dado crlf)
)

;(defrule fallo)

; ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
; ░░░░░░░░░░░░░░░░░▄█▀▀▀▄░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
; ░░░░░░░░░░░░░░░░▀░░░░░░░█░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
; ░░░░░░░░░░░░░░░▌░░░░░░░░░█░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
; ░░░░░░░░░░░░░░█░░░░░░░▐█░░▌░░░░░░░░░░░░░░░░░░░░░░░▄▄███▄▄░░░░░░░░░░░░░▄▄▄░░░░░░░░░░░░░░░░░░░░░░
; ░░░░░░░░░░░░░▐░░░░░░░░░░░░█▄░░░░░░░░░░░░░░░░░░░░█▀░░░░░░░▀█░░░░░░░▄█▀▀░░░░█░░░░░░░▄░░░░░░░░░░░░
; ░░░░░░░░░░░░░█░░░░░░░░░░░░████▄▄░░░░░░░░░░░░░░█▀░░░░░░░░░░░█░░░░░█░░░░░░░░░░░░░░░█░█░░░░░░░░░░░
; ░░░█▀▄▄░░░░░░▌░░░░░░░░░░░░█████▀░░░░░░░░░░░░░█░░░░░░░░░░░░░░█░░░█░░░░░░░░░░░░░░░█░░░█░░░░░░░░░░
; ░░▐░░░░░▀▀█▄▄▄▄▄░░░░░░░░░░███▀░░░░░░░░░░░░░░░█░░░░░░░░░░░░░░░▌░█░░░░░░░░░░░░░░░▐░░░░░█░░░░░░░░░
; ░░▐░░░░░░░░░░░░░░▀▀▀▀▀▀▀▀▀▀▀▀█▄▄░░░░░░░░░░░░░▌░░░░░░░░░░░░░░░█░▌░░░░░░░░░░░░░░░█░░░░░░▌░░░░░░░░
; ░░░▌░░░░░░░░░░░░░░░░░░░░░░░░░░░░▀█░░░░░░░░░░▐░░░░░░░░░░░░░░░░▌▐░░░░░░░░░░░░░░░▐▄▄▄▄▄▄▄█░░░░░░░░
; ░░░▌░░░░░░░░░░░░░░░▄▄▄▄▄▄░░░░░░░░░░░░░░░░░░░▐░░░░░░░░░░░░░░░▐░░▌░░░░░░░░░░░░░░█▀░░░░░░░▌░░░░░░░
; ░░░▌░░░░░░░░░░░██▀▀░░░░░░░░░░░░░░░░█░░░░░░░░░▌░░░░░░░░░░░░░░█░░█░░░░░░░░░░░░░▐░░░░░░░░░█░░░░░░░
; ░░░▐░░░░░░░░░░░░░█▄░░░░░░░░░░░░░░░░▀░░░░░░░░░█░░░░░░░░░░░░░█░░░░█░░░░░░░░░▄░░█░░░░░░░░░░█░░░░░░
; ░░░░█░░░░░░░░░░░░░░░▀▀▀▀▀░░░░░░░░▄█░░░░░░░░░░░█░░░░░░░░░░░█░░░░░░█▄▄░░░░▄█░░▐▌░░░░░░░░░░░░░░░░░
; ░░░░░░▀█▄▄░░░░░░░░░░░░░▄▄▄▄▄▄▄█▀▀░░░░░░░░░░░░░░▀▄▄▄▄▄▄▄▄▀░░░░░░░░░░░▀▀▀▀░░░░░░░░░░░░░░░░░░░░░░░
; ░░░░░░░░░░▀▀▀▀▀▀▀▀▀▀▀▀▀░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
; ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░


(defrule CasillaNormalOca
  ;;Condiciones necesarias
  (object (is-a SESION) (nombreJuego oca) (nombreBambino ?bam)) ;; Que exista una sesión
  ?turno <- (object (is-a TURNO)(valorDado ?dado)(fase movimiento)(jugador ?nomJug)) ;; Que la fase de juego sea movimiento porque ya se ha tirado el dado
  ;;Instancias necesarias
  ?jugador <- (object(is-a JUGADOR)(posicion ?posJug)(nombre ?nomJug))
  (object(is-a CASILLA)(nombreJuego oca)(tipo normal)(posicion ?posCas))
  (test (= ?posCas (+ ?posJug ?dado)))
  =>
  (modify-instance ?jugador (posicion (+ ?posJug ?dado)));;Sumamos el avance marcado en el dado
  (modify-instance ?turno (fase cambioTurno));; Cambio de fase para que juegue el siguiente
  (printout t ?nomJug " : Estoy en la posicion " ?posJug ", avanzo " ?dado " casillas, hasta la posición " (+ ?posJug ?dado) crlf)
)

(defrule CasillaAvanzaRetrocedeOca ;; en esta regla se ejecutan tanto las casillas oca, como las puente, como la muerte (avance y retroceso)
  ;;Condiciones necesarias
  (object (is-a SESION) (nombreJuego oca) (nombreBambino ?bam)) ;; Que exista una sesión
  ?turno <- (object (is-a TURNO)(valorDado ?dado)(fase movimiento)(jugador ?nomJug)) ;; Que la fase de juego sea movimiento porque ya se ha tirado el dado
  ?jugador <- (object(is-a JUGADOR)(posicion ?posJug)(nombre ?nomJug))
  (object(is-a CASILLA)(nombreJuego oca)(tipo movextra)(posicion ?posCas) (nuevoValorDado ?sumar) (mensaje ?mensaje))
  (test (= ?posCas (+ ?posJug ?dado)))
  =>
  (modify-instance ?jugador (posicion (+ ?sumar (+ ?posJug ?dado))));;Sumamos el avance marcado en el dado
  (modify-instance ?turno (fase cambioTurno));; Cambio de fase para que juegue el siguiente
  (printout t ?nomJug ": " ?mensaje crlf) 
  (printout t  ?nomJug ":Estoy en la posicion " ?posJug ", avanzo " ?dado " casillas, hasta la posición " (+ ?sumar (+ ?posJug ?dado)) crlf)
)
; (defrule CasillaEspera
;   ;;Condiciones necesarias
;   (object (is-a SESION) (nombreJuego oca) (nombreBambino ?bam)) ;; Que exista una sesión
;   ?turno <- (object (is-a TURNO)(valorDado ?dado)(fase movimiento)(jugador ?nomJug)) ;; Que la fase de juego sea movimiento porque ya se ha tirado el dado
;   ;;Instancias necesarias
;   ?jugador1 <- (object(is-a JUGADOR)(posicion ?posJug1)(nombre ?nomJug))
;   ?jugador2 <- (object(is-a JUGADOR)(posicion ?posJug2)(nombre ?nomJug2)(numTurnos ?otroTurnos ))
;   ?casilla <- (object(is-a CASILLA)(nombreJuego oca)(tipo espera)(posicion ?posCas)(mensaje ?mensaje))
;   (test (= ?posCas (+ ?posJug ?dado)))
;   =>
;   (modify-instance ?jugador1 (posicion (+ ?posJug ?dado)));;Sumamos el avance marcado en el dado
;   (modify-instance ?jugador2 (numTurnos + (?otroTurnos 1)))
;   ;; (modify-instance ?jugador2 (numTurnos (+ ?nT 1))) habria que cambiar el numero de turnos del jugador que no ha caido en la carcel
;   (printout t ?nomJug ": "?mensaje crlf) 
;   (modify-instance ?turno (fase cambioTurno));; Cambio de fase para que juegue el siguiente
; )
(defrule CasillafinOca
  ;; Condiciones necesarias
  (object (is-a SESION) (nombreJuego oca) (nombreBambino ?bam)) ;; Que exista una sesión
  ?turno <- (object (is-a TURNO)(valorDado ?dado)(fase movimiento)(jugador ?nomJug)) ;; Que la fase de juego sea tirar dado/piedra
  ;;Instancias necesarias
  ?juego <- (object(is-a JUEGO) (nombre oca)) 
  ?jugador <- (object(is-a JUGADOR)(posicion ?posJug)(nombre ?nomJug))
  ?casilla <- (object(is-a CASILLA)(nombreJuego oca)(tipo final)(posicion ?posCas)(mensaje ?mensaje));; la casilla tiene que ser de tipo final
  
  (test (< ?posCas (+ (+ ?posJug  ?dado) 1))) ; si es solo para la oca posicion seria 40, sino no hace falta ponerlo 
  =>
  ;;este primer modify instance creo que no haría falta porque ya sSe sabría con el test de arriba que se ha llegado al final, 
  ;; no hace falta cambiar la posición del jugador porque no se va a utilizar despues, se termina el juego 
  (modify-instance ?turno (fase fin));; Cambio de fase para que juegue el siguiente
  (printout t  "Avanzo " ?dado " casillas, hasta la posición " (+ ?posJug ?dado) crlf)
  (printout t  ?mensaje crlf)
  (halt)
)

; ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
; ░░░░░░░░░▄▄▄▄▄▄░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
; ░░░░░░░█▀░░░░░░▀█░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
; ░░░░░▄▀░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
; ░░░░█░░░░░░░░░░░░▄█░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
; ░░░░▀▀▀▀▀██▀▀██▀▀░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
; ░░░░░░░░░▐░░░░▌░░░░░░░░░░░░░░░▄░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
; ░░░▄▄▄▄▄▄█▄▄▄▄█░░░░░░░░░░░░░▐▀░█░░░░░░░▄░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
; ░░▐░░░▌░░▐░░░░█▀▀▀█▀▀█░░░░░░▌░░░▌░░░░░▀▐░░░░░░░░▌░░░░░░░░░░░░░░░░░░░░░░░░░▄░░░░░░░░░░░░░░░░░░░░
; ░░▐░░░▌░░▐░░░░▌░░░█░░░▌░░░░░▌░▄█░░░░░▐░░▌░░░█░░█░░▐░░░█░░▐▀▀▀░░░░█░░░░░░░█░▌░░░░░░░░░░░░░░░░░░░
; ░░▐▄▄▄█▄▄█▄▄▄▄█▄▄▄█▄▄▄▌░░░░▐██░░░░░░░█░░▐░░░░██░░░█░░░▐░░█░░░░░░░▌░░░░░░░▌░█░░░░░░░░░░░░░░░░░░░
; ░░░░░░░░░█░░░░▌░░░░░░░░░░░░▐░█░░░░░░▐▄▄▄█░░░░▐░░░░▌░░░▐░░▌▄█▀░░░▐░░░░░░░█▄▄█░░░░░░░░░░░░░░░░░░░
; ░░░░░░░░░█▄▄▄▄█░░░░░░░░░░░░█░░█░░░░░█░░░▐░░░░▌░░░░▌░░░█░░▌░░░░░░▐░░░░░░░▌░░░▌░░░░░░░░░░░░░░░░░░
; ░░░░░░░░░▌░░░░▌░░░░░░░░░░░░▌░░░▀▄░░░▌░░░░▌░░█░░░░░▌░░█░░░█▄▄▄▄░░▐░░░░░░▐░░░░▄░░░░░░░░░░░░░░░░░░
; ░░░░░░░░▐▄▄▄▄▄▌░░░░░░░░░░░░▀░░░░░█░░░░░░░░░░▌░░░░░░█▀░░░░░░░░░░░▐▄▄▄▄░░░░░░░░░░░░░░░░░░░░░░░░░░
; ░░░░░░░░▐░░░░░▌░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
; ░░░░░░░░▐▄▄▄▄▄▌░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
; ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
;;Reglas de la Rayuela
(defrule saltaUnaRayuela
  ;;Condiciones necesarias
  (object (is-a SESION)(nombreJuego rayuela))
  (object (is-a TURNO)(fase movimiento)(valorDado ?valDado)(jugador ?nomJug))
  (object (is-a CASILLA)(nombreJuego rayuela)(tipo piedra));; Tiene que haber dos casillas de piedra, una para la ida y otra para la vuelta, pero como se instancian a la vez con que haya una mínima (máximo dos)
  (object (is-a CASILLA)(nombreJuego rayuela)(tipo piedra))
  ;;Instancias necesarias
  ?jugador <- (object (is-a JUGADOR)(nombre ?nomJug)(posicion ?posJug))
  (object (is-a CASILLA)(tipo normal)(nombreJuego rayuela)(posicion ?posCas))

  (test (= (+ ?posJug 1) ?posCas))
  =>
  (modify-instance ?jugador(posicion (+ 1 ?posJug)))
  (printout t ?nomJug ": Salto a la casilla " (+ 1 ?posJug) crlf)
)
(defrule saltarPiedra
  ;; Condiones necesarias
  (object (is-a SESION)(nombreJuego rayuela))
  (object (is-a CASILLA)(nombreJuego rayuela)(tipo piedra));; Tiene que haber dos casillas de piedra, una para la ida y otra para la vuelta, pero como se instancian a la vez con que haya una mínima (máximo dos)
  (object (is-a TURNO)(fase movimiento)(valorDado ?valDado)(jugador ?nomJug))
  ;; Instancias necesarias
  ?jugador <- (object (is-a JUGADOR)(nombre ?nomJug)(posicion ?posJug))
  (object(is-a CASILLA)(posicion ?posCas)(tipo piedra)(mensaje ?mensaje))
  (test (= ?posCas (+ 1 ?posJug)))
  =>
  (modify-instance ?jugador (posicion (+ 2 ?posJug)))
  (printout t ?nomJug ": " ?mensaje ", a la casilla " (+ 2 ?posJug) crlf)
)
(defrule setPiedra
  (object (is-a SESION)(nombreJuego rayuela))
  (object (is-a TURNO)(valorDado ?posPiedra)(fase movimiento))
  (object (is-a JUEGO)(nombre rayuela)(maxCasillas ?posPiedraVuelta))
  ?casillaIda <- (object (is-a CASILLA)(posicion ?posPiedra)(tipo normal)(nombreJuego rayuela))
  ?casillaVuelta <- (object (is-a CASILLA)(posicion ?posPiedraVuelta)(tipo normal)(nombreJuego rayuela))
  =>
  (modify-instance ?casillaIda (tipo piedra)(nuevoValorDado 2)(mensaje "Salto la piedra que no la quiero pisar"))
  (modify-instance ?casillaVuelta (tipo piedra)(nuevoValorDado 2)(mensaje "Recojo la piedra que no quiero perderla"))
  (printout t "La casilla " ?posPiedra " y "?posPiedraVuelta" van a ser la piedra"crlf)
)
(defrule finRondaRayuela
  ;; Condiciones necesarias
  (object (is-a SESION)(nombreJuego rayuela))
  (object (is-a JUEGO)(nombre rayuela)(rondas ?maxRon))
  ?turno <- (object (is-a TURNO)(fase movimiento)(jugador ?nomJug))
  ;; Instancias necesarioas
  ?jugador <- (object (is-a JUGADOR)(nombre ?nomJug)(posicion ?posJug)(rondasGanadas ?ronGan))
  ?piedraIda <- (object (is-a CASILLA)(tipo piedra)(posicion ?posPiedra1))
  ?piedraVuelta <- (object (is-a CASILLA)(tipo piedra)(posicion ?posPiedra2))
  (test (not (= ?posPiedra1 ?posPiedra2)))
  (test (or (= ?posJug 17)(= ?posJug 18)))
  (test (> ?maxRon ?ronGan))
  =>
  (modify-instance ?jugador (rondasGanadas (+ 1 ?ronGan))(posicion 0))
  (modify-instance ?turno (fase cambioTurno))
  (modify-instance ?piedraIda (tipo normal)(mensaje ""))
  (modify-instance ?piedraVuelta (tipo normal)(mensaje ""))
  (printout t ?nomJug ": He ganado la ronda " (+ 1 ?ronGan) " Te toca a tí ahora" crlf)
)
(defrule finJuegoRayuela
  ;;Condiciones necesarias
  (object (is-a SESION)(nombreJuego rayuela))
  (object (is-a JUEGO)(nombre rayuela)(rondas ?maxRon))
  (object (is-a CASILLA)(posicion ?posCas)(tipo final))
  ?turno <- (object (is-a TURNO)(fase movimiento)(jugador ?nomJug))
  ?jugador <- (object (is-a JUGADOR)(posicion ?posJug)(rondasGanadas ?ronGan)(nombre ?nomJug))
  (test (= ?posCas (+ 1 ?posJug)))
  (test (= ?maxRon ?ronGan))
  =>
  (modify-instance ?turno (fase fin))
  (modify-instance ?jugador (rondasGanadas (+ 1 ?ronGan)))
  (printout t ?nomJug " : ¡He ganado la ronda " (+ 1 ?ronGan)", ergo he ganado el juego!"crlf)

)