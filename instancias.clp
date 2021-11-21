(definstances jugador
    (of ROBOT)
    (of BAMBINO (nombre Giuseppe)(saludo "Hola, bichito")(personalidad timido))
    (of BAMBINO (nombre Franchesca)(saludo "¡General Kenoby!")(personalidad torpe))
)
(definstances juegos
    ; (of JUEGO (nombre oca)(maxCasillas 40)(rondas 1))
    (of JUEGO (nombre rayuela)(maxCasillas 6)(rondas 2))
)

;; Definimos las intancias en las que se especifica cuales son las interacciones del robot
(definstances listaReacciones
    (of LISTAREACCIONES (estado llorando)(nombreJuego oca)(fase cambioTurno)(reaccion "Ea, ea, a llorar a la llorería"))
    (of LISTAREACCIONES (estado escondido)(nombreJuego oca)(fase cambioTurno)(reaccion "No te escondas, ¡qué no pasa nada!"))
    (of LISTAREACCIONES (estado gritando)(nombreJuego oca)(fase cambioTurno)(reaccion "Vamos a tranquilizarnos, respira conmigo, uuuuuuufff aaaaaaafff uuuuuuuuf affffff"))
    (of LISTAREACCIONES (estado gritando)(nombreJuego oca)(fase movimiento)(reaccion "Vamos a tranquilizarnos, respira conmigo, uuuuuuufff aaaaaaafff uuuuuuuuf affffff"))
    (of LISTAREACCIONES (estado normal)(nombreJuego oca)(fase tirada)(reaccion "¡Uy! Se ha caído el dado fuera de la mesa. ¡Prueba a tirar otra vez!"))
    (of LISTAREACCIONES (estado tirado)(nombreJuego rayuela)(fase movimiento)(reaccion "No pasa nada porque te hayas caído, inténtalo otra vez, que ya verás que esta vez lo consigues"))
    (of LISTAREACCIONES (estado normal)(nombreJuego rayuela)(fase tirada)(reaccion "¡Uy! Se te ha ido fuera la piedra. ¡Prueba a tirar otra vez!"))
    (of LISTAREACCIONES (estado normal)(nombreJuego rayuela)(fase movimiento)(reaccion "¡Has pisado una línea! Tienes que empezar otra vez desde la casilla inicial"))
    (of LISTAREACCIONES (estado normal)(nombreJuego rayuela)(fase movimiento)(reaccion "¡Has pisado la casilla de la piedra! Tienes que empezar otra vez desde la casilla inicial"))
)

(definstances listaPersonalidades
    (of LISTAPERSONALIDADES (adaptadoA timido)(juego oca)       (saludo "Vamos a jugar a la oca (Hablando mas bajo que el estandar y despacio)")            (reglas "En este juego se tira el dado y dependiendo de la casilla en la que se caiga al sumar el valor del dado se queda uno donde esta, se avanza, se retrocede o se pierde turno. El que llegue a la Oca final antes gana el juego. "))
    (of LISTAPERSONALIDADES (adaptadoA timido)(juego rayuela)   (saludo "Vamos a jugar a la rayuela (Hablando mas bajo que el estandar y despacio) ")       (reglas "En este juego hay que tirar la piedra para que caiga en una casilla, habrá que saltar de casilla en casilla a la pata coja sin pisar la de la piedra y en el camino de vuelta recogerla"))
    (of LISTAPERSONALIDADES (adaptadoA torpe)(juego oca)        (saludo "¡Estoy aquí abajo pequeñin! Vamos a jugar a la oca")                               (reglas "En este juego se tira el dado y dependiendo de la casilla en la que se caiga al sumar el valor del dado se queda uno donde esta, se avanza, se retrocede o se pierde turno. El que llegue a la Oca final antes gana el juego. ¿Te has enterado bien?"))
    (of LISTAPERSONALIDADES (adaptadoA torpe)(juego rayuela)    (saludo "¡Estoy aquí abajo pequeñin! Vamos a jugar a la rayuela")                           (reglas "En este juego hay que tirar la piedra para que caiga en una casilla, habrá que saltar de casilla en casilla a la pata coja sin pisar la de la piedra y en el camino de vuelta recogerla. Ten cuidado no te caigas"))
    (of LISTAPERSONALIDADES (adaptadoA normal)(juego oca)       (saludo "Vamos a jugar a la oca")                                                           (reglas "En este juego se tira el dado y dependiendo de la casilla en la que se caiga al sumar el valor del dado se queda uno donde esta, se avanza, se retrocede o se pierde turno. El que llegue a la Oca final antes gana el juego. "))
    (of LISTAPERSONALIDADES (adaptadoA normal)(juego rayuela)   (saludo "Vamos a jugar a la rayuela")                                                       (reglas "En este juego hay que tirar la piedra para que caiga en una casilla, habrá que saltar de casilla en casilla a la pata coja sin pisar la de la piedra y en el camino de vuelta recogerla "))
)

;; Definimos las instancias para las casillas de los dos juegos y el dado
(definstances dado ;; El dado representa tanto la tirada del dado de oca y el lanzamiento de la piedra en la rayuela
    (of DADO (valorDado 1)(juego oca))
    (of DADO (valorDado 2)(juego oca))
    (of DADO (valorDado 3)(juego oca))
    (of DADO (valorDado 4)(juego oca))
    (of DADO (valorDado 5)(juego oca))
    (of DADO (valorDado 6)(juego oca))
    (of DADO (valorDado 1)(juego rayuela))
    ; (of DADO (valorDado 2)(juego rayuela))
    ; (of DADO (valorDado 3)(juego rayuela))
    ; (of DADO (valorDado 4)(juego rayuela))
    ; (of DADO (valorDado 5)(juego rayuela))
    ; (of DADO (valorDado 6)(juego rayuela))
    ; (of DADO (valorDado 7)(juego rayuela))
    ; (of DADO (valorDado 8)(juego rayuela))
    ; (of DADO (valorDado 9)(juego rayuela))
)
;Había hecho una casilla tipo inicial y al final no la he utilizado
(definstances casillaRayuela ;; El valor piedra se definirá en la tirada de cada jugador
    (of CASILLA (posicion 0)(nombreJuego rayuela))
    (of CASILLA (posicion 1)(nombreJuego rayuela))
    (of CASILLA (posicion 2)(nombreJuego rayuela))
    (of CASILLA (posicion 3)(nombreJuego rayuela))
    (of CASILLA (posicion 4)(nombreJuego rayuela))
    (of CASILLA (posicion 5)(nombreJuego rayuela))
    (of CASILLA (posicion 6)(nombreJuego rayuela))
    (of CASILLA (posicion 7)(nombreJuego rayuela))
    (of CASILLA (posicion 8)(nombreJuego rayuela))
    (of CASILLA (posicion 9)(nombreJuego rayuela))
    (of CASILLA (posicion 10)(nombreJuego rayuela))
    (of CASILLA (posicion 11)(nombreJuego rayuela))
    (of CASILLA (posicion 12)(nombreJuego rayuela))
    (of CASILLA (posicion 13)(nombreJuego rayuela))
    (of CASILLA (posicion 14)(nombreJuego rayuela))
    (of CASILLA (posicion 15)(nombreJuego rayuela))
    (of CASILLA (posicion 16)(nombreJuego rayuela))
    (of CASILLA (posicion 17)(nombreJuego rayuela))
    (of CASILLA (tipo final)(posicion 18)(nombreJuego rayuela)(mensaje "¡He completado una ronda!"))  ;; la casilla final es el cielo
    (of CASILLA (tipo final)(posicion 19)(nombreJuego rayuela)(mensaje "¡He completado una ronda!"))  ;; la casilla final es el cielo

)

(definstances casillaOca
    (of CASILLA (posicion 0)(nombreJuego oca))
    (of CASILLA (posicion 1)(nombreJuego oca))
    (of CASILLA (posicion 2)(nombreJuego oca))
    (of CASILLA (posicion 3)(nombreJuego oca))
    (of CASILLA (posicion 4)(nombreJuego oca))
    (of CASILLA (tipo movextra)(nuevoValorDado 5)(posicion 5)(nombreJuego oca) (mensaje "De oca en oca y tiro porque me toca"))
    (of CASILLA (posicion 6)(nombreJuego oca))
    (of CASILLA (tipo movextra)(nuevoValorDado 7)(posicion 7)(nombreJuego oca) (mensaje "De puente en puente y me lleva la corriente"))
    (of CASILLA (posicion 8)(nombreJuego oca))
    (of CASILLA (posicion 9)(nombreJuego oca))
    (of CASILLA (tipo movextra)(nuevoValorDado 5)(posicion 10)(nombreJuego oca)(mensaje "De oca en oca y tiro porque me toca"))
    (of CASILLA (posicion 11)(nombreJuego oca))
    (of CASILLA (posicion 12)(nombreJuego oca))
    (of CASILLA (posicion 13)(nombreJuego oca))
    (of CASILLA (tipo movextra)(nuevoValorDado -7)(posicion 14)(nombreJuego oca)(mensaje "De puente en puente y me lleva la corriente"))
    (of CASILLA (tipo movextra)(nuevoValorDado 5)(posicion 15)(nombreJuego oca)(mensaje "De oca en oca y tiro porque me toca"))
    (of CASILLA (posicion 16)(nombreJuego oca))
    (of CASILLA (posicion 17)(nombreJuego oca))
    (of CASILLA (posicion 18)(nombreJuego oca))
    (of CASILLA (posicion 19)(nombreJuego oca))
    (of CASILLA (tipo movextra)(nuevoValorDado 5)(posicion 20)(nombreJuego oca)(mensaje "De oca en oca y tiro porque me toca"))
    (of CASILLA (posicion 21)(nombreJuego oca))
    (of CASILLA (posicion 22)(nombreJuego oca))
    (of CASILLA (posicion 23)(nombreJuego oca))
    (of CASILLA (posicion 24)(nombreJuego oca))
    (of CASILLA (tipo movextra)(nuevoValorDado 5)(posicion 25)(nombreJuego oca)(mensaje "De oca en oca y tiro porque me toca"))
    (of CASILLA (posicion 26)(nombreJuego oca))
    (of CASILLA (posicion 27)(nombreJuego oca))
    (of CASILLA (posicion 28)(nombreJuego oca))
    (of CASILLA (posicion 29)(nombreJuego oca))
    (of CASILLA (tipo movextra)(nuevoValorDado 5)(posicion 30)(nombreJuego oca)(mensaje "De oca en oca y tiro porque me toca"))
    (of CASILLA (posicion 31)(nombreJuego oca))
    (of CASILLA (posicion 32)(nombreJuego oca))
    (of CASILLA (posicion 33)(nombreJuego oca))
    (of CASILLA (posicion 34)(nombreJuego oca))
    (of CASILLA (posicion 35)(nombreJuego oca))
    (of CASILLA (tipo movextra)(nuevoValorDado -36)(posicion 36)(nombreJuego oca)(mensaje "¡Uy caiste en la muerte, tienes que volver a empezar!"))
    (of CASILLA (posicion 37)(nombreJuego oca))
    (of CASILLA (posicion 38)(nombreJuego oca))
    (of CASILLA (posicion 39)(nombreJuego oca))
    (of CASILLA (tipo final)(posicion 40)(nombreJuego oca)(mensaje "¡Soy el ganador!"))
    (of CASILLA (tipo final)(posicion 41)(nombreJuego oca)(mensaje "¡Soy el ganador!"))
    (of CASILLA (tipo final)(posicion 42)(nombreJuego oca)(mensaje "¡Soy el ganador!"))
    (of CASILLA (tipo final)(posicion 43)(nombreJuego oca)(mensaje "¡Soy el ganador!"))
    (of CASILLA (tipo final)(posicion 44)(nombreJuego oca)(mensaje "¡Soy el ganador!"))
    (of CASILLA (tipo final)(posicion 45)(nombreJuego oca)(mensaje "¡Soy el ganador!"))
)