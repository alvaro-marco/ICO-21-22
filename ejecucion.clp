(clear)
(load ontologia.clp)
(load instancias.clp)
(load reglas.clp)
(reset)
(set-strategy random)
(run)
(run 1)
(run 2)
(agenda)
(instances)


; (defrule CasillaFIN
;   ;; Condiciones necesarias
;   ;; el numero de rondas para ganar de juego tiene que ser el mismo que el numero de rondas ganadas para el jugador
;   ;; 1 para la oca y 3 para la rayuela
;   ;; la casilla tiene que ser de tipo final
;   ;; el juego de la sesion no se define para que puedan ser ambos
;   (object (is-a SESION) (nombreJuego ?juego) (nombreBambino ?bam)) ;; Que exista una sesión
;   ?turno <- (object (is-a TURNO)(valorDado ?dado)(fase movimiento)(jugador ?nomJug)) ;; Que la fase de juego sea movimiento porque ya se ha tirado el dado
;   ;;Instancias necesarias
;   ?juego <- (object(is-a JUEGO) (nombre ?juego)(rondas ?numRondas)) 
;   ?jugador <- (object(is-a JUGADOR)(posicion ?posJug)(nombre ?nomJug)(rondasGanadas ?ganadas))
;   ?casilla <- (object(is-a CASILLA)(nombreJuego ?juego)(tipo final)(posicion ?posCas)(mensaje ?mensaje))
;    ; si es solo para la oca posicion seria 40, sino no hace falta ponerlo 
;   (test (< ?posCas (+ (+ ?posJug  ?dado) 1)))
;   (test (= ?numRondas ?ganadas))
;   =>
;   ;;este primer modify instance creo que no haría falta porque ya sSe sabría con el test de arriba que se ha llegado al final, 
;   ;; no hace falta cambiar la posición del jugador porque no se va a utilizar despues, se termina el juego 
;   (modify-instance ?turno (fase fin));; Cambio de fase para que juegue el siguiente
;   (printout t  ?nomJug ": Avanzo " ?dado " casillas, hasta la posición " (+ ?posJug ?dado) crlf)
;   (printout t  ?nomJug ": " ?mensaje crlf)
;   (halt)