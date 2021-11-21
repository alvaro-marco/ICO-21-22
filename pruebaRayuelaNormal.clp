(definstances jugador
    (of ROBOT)
    (of BAMBINO (nombre Giuseppe)(saludo "Hola, bichito")(personalidad timido))
    (of BAMBINO (nombre Franchesca)(saludo "¡General Kenoby!")(personalidad torpe))
)
(definstances juegos
    (of JUEGO (nombre rayuela)(maxCasillas 6)(rondas 2))
)

;; Definimos las intancias en las que se especifica cuales son las interacciones del robot
(definstances listaReacciones
    (of LISTAREACCIONES (estado normal)(nombreJuego rayuela)(motivo "Estoy fuertísimo")(fase tirada)(reaccion "¡Uy! Se te ha ido fuera la piedra. ¡Prueba a tirar otra vez!"))
    (of LISTAREACCIONES (estado normal)(nombreJuego rayuela)(motivo "Uy, ¿ésto es trampa?")(fase movimiento)(reaccion "¡Has pisado una línea! Venga, no te preocupes, que nadie estaba mirando"))
    (of LISTAREACCIONES (estado normal)(nombreJuego rayuela)(motivo "Ay, he pisado algo")(fase movimiento)(reaccion "¡Has pisado la casilla de la piedra! Venga, no te preocupes, que nadie estaba mirando"))
)

(definstances listaPersonalidades
    (of LISTAPERSONALIDADES (adaptadoA timido)(juego rayuela)   (saludo "Vamos a jugar a la rayuela (Hablando mas bajo que el estandar y despacio) ")       (reglas "En este juego hay que tirar la piedra para que caiga en una casilla, habrá que saltar de casilla en casilla a la pata coja sin pisar la de la piedra y en el camino de vuelta recogerla"))
    (of LISTAPERSONALIDADES (adaptadoA torpe)(juego rayuela)    (saludo "¡Estoy aquí abajo pequeñin! Vamos a jugar a la rayuela")                           (reglas "En este juego hay que tirar la piedra para que caiga en una casilla, habrá que saltar de casilla en casilla a la pata coja sin pisar la de la piedra y en el camino de vuelta recogerla. Ten cuidado no te caigas"))
    (of LISTAPERSONALIDADES (adaptadoA normal)(juego rayuela)   (saludo "Vamos a jugar a la rayuela")                                                       (reglas "En este juego hay que tirar la piedra para que caiga en una casilla, habrá que saltar de casilla en casilla a la pata coja sin pisar la de la piedra y en el camino de vuelta recogerla "))
)

;; Definimos las instancias para las casillas de los dos juegos y el dado
(definstances dado ;; El dado representa tanto la tirada del dado de oca y el lanzamiento de la piedra en la rayuela
    (of DADO (valorDado 1)(juego rayuela))
    (of DADO (valorDado 2)(juego rayuela))
    (of DADO (valorDado 3)(juego rayuela))
    (of DADO (valorDado 4)(juego rayuela))
    (of DADO (valorDado 5)(juego rayuela))
    (of DADO (valorDado 6)(juego rayuela))
    (of DADO (valorDado 7)(juego rayuela))
    (of DADO (valorDado 8)(juego rayuela))
    (of DADO (valorDado 9)(juego rayuela))
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