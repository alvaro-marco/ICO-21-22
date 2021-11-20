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
    (printout t "robot: Te cuento las reglas:" crlf ?r crlf)
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
  ;;?rayuela <-(object (is-a JUEGO) (nombre rayuela))
  =>
  (modify-instance ?turno (valorDado ?dado)(fase movimiento)) ;; Cambiamos el valor del dado escogido y la fase de juego´
  ;(modify-instance ?rayuela (maxCasillas (- 18 ?dado)))
  (printout t ?nomJug ": He sacado un " ?dado crlf)
  (printout t ?nomJug ": Si estas jugando a la rayuela la piedra ha caído en la casilla " ?dado crlf)
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
  ?casilla <- (object(is-a CASILLA)(nombreJuego oca)(tipo normal)(posicion ?posCas))
  (test (= ?posCas (+ ?posJug ?dado)))
  =>
  (modify-instance ?jugador (posicion (+ ?posJug ?dado)));;Sumamos el avance marcado en el dado
  (modify-instance ?turno (fase cambioTurno));; Cambio de fase para que juegue el siguiente
  (printout t ?nomJug ": Estoy en la posicion " ?posJug ", avanzo " ?dado " casillas, hasta la posición " (+ ?posJug ?dado) crlf)
)

(defrule CasillaAvanzaRetrocedeOca ;; en esta regla se ejecutan tanto las casillas oca, como las puente, como la muerte (avance y retroceso)
  ;;Condiciones necesarias
  (object (is-a SESION) (nombreJuego oca) (nombreBambino ?bam)) ;; Que exista una sesión
  ?turno <- (object (is-a TURNO)(valorDado ?dado)(fase movimiento)(jugador ?nomJug)) ;; Que la fase de juego sea movimiento porque ya se ha tirado el dado
  ?jugador <- (object(is-a JUGADOR)(posicion ?posJug)(nombre ?nomJug))
  ?casilla <- (object(is-a CASILLA)(nombreJuego oca)(tipo movextra)(posicion ?posCas) (nuevoValorDado ?sumar) (mensaje ?mensaje))
  (test (= ?posCas (+ ?posJug ?dado)))
  =>
  (modify-instance ?jugador (posicion (+ ?sumar (+ ?posJug ?dado))));;Sumamos el avance marcado en el dado
  (printout t ?nomJug ": " ?mensaje crlf) 
  (modify-instance ?turno (fase cambioTurno));; Cambio de fase para que juegue el siguiente
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
  ;; el numero de rondas para ganar de juego tiene que ser el mismo que el numero de rondas ganadas para el jugador
  ;; 1 para la oca y 3 para la rayuela
  ;; la casilla tiene que ser de tipo final
  ;; el juego de la sesion no se define para que puedan ser ambos
  (object (is-a SESION) (nombreJuego oca) (nombreBambino ?bam)) ;; Que exista una sesión
  ?turno <- (object (is-a TURNO)(valorDado ?dado)(fase movimiento)(jugador ?nomJug)) ;; Que la fase de juego sea movimiento porque ya se ha tirado el dado
  ;;Instancias necesarias
  ?juego <- (object(is-a JUEGO) (nombre oca)(rondas ?numRondas)) 
  ?jugador <- (object(is-a JUGADOR)(posicion ?posJug)(nombre ?nomJug))
  ?casilla <- (object(is-a CASILLA)(nombreJuego oca)(tipo final)(posicion ?posCas)(mensaje ?mensaje))
   ; si es solo para la oca posicion seria 40, sino no hace falta ponerlo 
  (test (< ?posCas (+ (+ ?posJug  ?dado) 1)))
  =>
  ;;este primer modify instance creo que no haría falta porque ya sSe sabría con el test de arriba que se ha llegado al final, 
  ;; no hace falta cambiar la posición del jugador porque no se va a utilizar despues, se termina el juego 
  (modify-instance ?turno (fase fin));; Cambio de fase para que juegue el siguiente
  (printout t  ?nomJug ": Avanzo " ?dado " casillas, hasta la posición " (+ ?posJug ?dado) crlf)
  (printout t  ?nomJug ": " ?mensaje crlf)
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
;; preguntas
;; el jugador salta y completara una ronda si se cumplen las siguientes condiciones:
; el jugador no se cae 
; el jugador no pisa una línea
; el jugador salta la casilla en la que está la piedra
; el jugador llega al final y cambia de dirección
; el jugador recoge la piedra
; el jugador llega otra vez a la casilla de inicio 
; rondas ganadas += 1

;;DILEMAS
;; se obtiene el valor del dado
;; se salta de uno en uno?
;; como se avanza 
;; como se retrocede

(defrule saltaUnaRayuela
  (object (is-a SESION)(nombreJuego rayuela)(nombreBambino ?bam))
  ?turno <- (object (is-a TURNO)(fase movimiento)(valorDado ?valDado)(jugador ?nomJug))

  ?jugador <- (object (is-a JUGADOR)(nombre ?nomJug)(posicion ?posJug))
  (object (is-a CASILLA)(tipo normal)(nombreJuego rayuela)(posicion ?posCas))

  (test (= (+ ?posJug 1) ?posCas))
  =>
  (modify-instance ?jugador(posicion (+ 1 ?posJug)))
  (printout t ?jugador ": Avanzo hasta la casilla " (+ 1 ?posJug) crlf)
)














































































































































; ;; casillas tipo normal piedra cielo
; (defrule saltaRayuela
;   ;;Condiciones necesarias
;   (object (is-a SESION) (nombreJuego rayuela) (nombreBambino ?bam)) ;; Que exista una sesión
;   ?turno <- (object (is-a TURNO)(valorDado ?dado)(fase movimiento)(jugador ?nomJug)) ;; Que la fase de juego sea movimiento porque ya se ha tirado
;   ;; Instancias necesarias para la piedra
;                 ?piedra <- (object(is-a CASILLA)(nombreJuego rayuela)(tipo normal)(posicion ?dado))
;                 ?recoger <- (object(is-a CASILLA)(nombreJuego rayuela)(tipo normal)(posicion ?posRecoger))
  
;   ;;Instancias necesarias
;   ?rayuela <- (object(is-a JUEGO)(nombre rayuela)(maxCasillas ?posRecoger))
;   ?jugador <- (object(is-a JUGADOR)(posicion ?posJug)(nombre ?nomJug))
;   ?casilla <- (object(is-a CASILLA)(nombreJuego rayuela)(tipo normal)(posicion ?posCas))
;   (test (not (= ?dado (+ ?posJug 1))))
;   (test (not (= ?posRecoger (+ ?posJug 1))))
;   (test (= ?posCas (+ ?posJug 1)))
;   =>
;   (modify-instance ?turno (fase cambioTurno))
;   (modify-instance ?jugador (posicion (+ ?posJug 1)));;Sumamos el salto
;   (printout t  ?nomJug ": Estoy en la posición " ?posJug ", salto 1 casilla" crlf)
;   (printout t "--- Modificadas las casillas " ?dado " y " ?posRecoger crlf)
;                 ;; Registramos en que casilla ha caido la piedra
;                 (modify-instance ?piedra (tipo piedra)(mensaje "Salto la casilla de la piedra"))
;                 (modify-instance ?recoger (tipo piedra)(mensaje "Recojo la piedra"))
; )

; (defrule saltarRecogerPiedra
;   (object (is-a SESION) (nombreJuego rayuela) (nombreBambino ?bam)) ;; Que exista una sesión
;   ?turno <- (object (is-a TURNO)(valorDado ?dado)(fase movimiento)(jugador ?nomJug)) ;; Que la fase de juego sea movimiento porque ya se ha tirado
;   ;;Instancias necesarias
;   ?jugador <- (object(is-a JUGADOR)(posicion ?posJug)(nombre ?nomJug))
;   ?casilla <- (object(is-a CASILLA)(nombreJuego rayuela)(tipo piedra)(posicion ?posCas)(mensaje ?msj))
;   (test (= ?dado (+ ?posJug 1))) ; si la siguiente es la casilla en la que esta la piedra
;   => 
;   (modify-instance ?jugador (posicion (+ ?posJug 2)));;Sumamos el salto doble
;   (printout t  ?nomJug ": Estoy en la posicion " ?posJug ", sin pisar la casilla de la piedra" crlf)
; )

; (defrule finRondaRayuela
;  (object (is-a SESION) (nombreJuego rayuela) (nombreBambino ?bam)) ;; Que exista una sesión
;   ?turno <- (object (is-a TURNO)(valorDado ?dado)(fase movimiento)(jugador ?nomJug)) ;; Que la fase de juego sea movimiento porque ya se ha tirado el dado
;   ;;Instancias necesarias
;   ?juego <- (object(is-a JUEGO) (nombre rayuela)) 
;   ?jugador <- (object(is-a JUGADOR)(posicion ?posJug)(nombre ?nomJug))
;   ?casilla <- (object(is-a CASILLA)(nombreJuego rayuela)(tipo final)(posicion ?posCas)(mensaje ?mensaje))
;    ; si es solo para la oca posicion seria 40, sino no hace falta ponerlo 
;   (test (= ?posCas ?posJug ))
;   =>
;   ;;este primer modify instance creo que no haría falta porque ya sSe sabría con el test de arriba que se ha llegado al final, 
;   ;; no hace falta cambiar la posición del jugador porque no se va a utilizar despues, se termina el juego 
;   (modify-instance ?turno (fase fin));; Cambio de fase para que juegue el siguiente
;   (printout t  ?nomJug ": Avanzo " ?dado " casillas, hasta la posición " (+ ?posJug ?dado) crlf)
;   (printout t  ?nomJug ": " ?mensaje crlf)

; )

; (defrule CasillafinRayuela
;   ;; Condiciones necesarias
;   ;; el numero de rondas para ganar de juego tiene que ser el mismo que el numero de rondas ganadas para el jugador
;   ;; 1 para la oca y 3 para la rayuela
;   ;; la casilla tiene que ser de tipo final
;   ;; el juego de la sesion no se define para que puedan ser ambos
;   (object (is-a SESION) (nombreJuego rayuela) (nombreBambino ?bam)) ;; Que exista una sesión
;   ?turno <- (object (is-a TURNO)(valorDado ?dado)(fase movimiento)(jugador ?nomJug)) ;; Que la fase de juego sea movimiento porque ya se ha tirado el dado
;   ;;Instancias necesarias
;   ?juego <- (object(is-a JUEGO) (nombre rayuela)(rondas ?numRondas)) 
;   ?jugador <- (object(is-a JUGADOR)(posicion ?posJug)(nombre ?nomJug)(rondasGanadas ?ganadas))
;   ?casilla <- (object(is-a CASILLA)(nombreJuego rayuela)(tipo final)(posicion ?posCas)(mensaje ?mensaje))
;    ; si es solo para la oca posicion seria 40, sino no hace falta ponerlo 
;   (test (= ?numRondas ?ganadas))
;   =>
;   ;;este primer modify instance creo que no haría falta porque ya sSe sabría con el test de arriba que se ha llegado al final, 
;   ;; no hace falta cambiar la posición del jugador porque no se va a utilizar despues, se termina el juego 
;   (modify-instance ?turno (fase fin));; Cambio de fase para que juegue el siguiente
;   (printout t  ?nomJug ": Avanzo " ?dado " casillas, hasta la posición " (+ ?posJug ?dado) crlf)
;   (printout t  ?nomJug ": ¡He completado las tres rondas y por lo tanto he ganado!" crlf)
;   (halt)
; )


