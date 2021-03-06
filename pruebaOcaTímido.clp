(definstances jugador
    (of ROBOT)
    (of BAMBINO (nombre Giuseppe)(saludo "Hola, bichito")(personalidad timido))
    (of BAMBINO (nombre Franchesca)(saludo "¡General Kenoby!")(personalidad timido))
)
(definstances juegos
    (of JUEGO (nombre oca)(maxCasillas 40)(rondas 1))
    (of JUEGO (nombre rayuela)(maxCasillas 6)(rondas 2))
)

;; Definimos las intancias en las que se especifica cuales son las interacciones del robot
(definstances listaReacciones
    (of LISTAREACCIONES (estado llorando)(nombreJuego oca)(motivo "Buaaaaah :'(")(fase cambioTurno)(reaccion "No te preocupes, no llores, ea ea"))
    (of LISTAREACCIONES (estado escondido)(nombreJuego oca)(motivo "¡Ay, que miedo el dibujo de esa casilla!")(fase cambioTurno)(reaccion "No te escondas, ¡qué no pasa nada!"))
    (of LISTAREACCIONES (estado gritando)(nombreJuego oca)(motivo "@#~~@#€~@#~#@#@!")(fase cambioTurno)(reaccion "Vamos a tranquilizarnos, respira conmigo, uuuuuuufff aaaaaaafff uuuuuuuuf affffff"))
    (of LISTAREACCIONES (estado gritando)(nombreJuego oca)(motivo "¡Reconcholis y retruecanos!")(fase movimiento)(reaccion "Vamos a tranquilizarnos, respira conmigo, uuuuuuufff aaaaaaafff uuuuuuuuf affffff"))
    (of LISTAREACCIONES (estado normal)(nombreJuego oca)(motivo "¿Dónde ha ido a parar el dado?")(fase tirada)(reaccion "¡Uy! Se ha caído el dado fuera de la mesa. ¡Prueba a tirar otra vez!"))
)

(definstances listaPersonalidades
    (of LISTAPERSONALIDADES (adaptadoA timido)(juego oca)       (saludo "Vamos a jugar a la oca (Hablando mas bajo que el estandar y despacio)")            (reglas "En este juego se tira el dado y dependiendo de la casilla en la que se caiga al sumar el valor del dado se queda uno donde esta, se avanza, se retrocede o se pierde turno. El que llegue a la Oca final antes gana el juego. "))
    (of LISTAPERSONALIDADES (adaptadoA torpe)(juego oca)        (saludo "¡Estoy aquí abajo pequeñin! Vamos a jugar a la oca")                               (reglas "En este juego se tira el dado y dependiendo de la casilla en la que se caiga al sumar el valor del dado se queda uno donde esta, se avanza, se retrocede o se pierde turno. El que llegue a la Oca final antes gana el juego. ¿Te has enterado bien?"))
    (of LISTAPERSONALIDADES (adaptadoA normal)(juego oca)       (saludo "Vamos a jugar a la oca")                                                           (reglas "En este juego se tira el dado y dependiendo de la casilla en la que se caiga al sumar el valor del dado se queda uno donde esta, se avanza, se retrocede o se pierde turno. El que llegue a la Oca final antes gana el juego. "))
)

;; Definimos las instancias para las casillas de los dos juegos y el dado
(definstances dado ;; El dado representa tanto la tirada del dado de oca y el lanzamiento de la piedra en la rayuela
    (of DADO (valorDado 1)(juego oca))
    (of DADO (valorDado 2)(juego oca))
    (of DADO (valorDado 3)(juego oca))
    (of DADO (valorDado 4)(juego oca))
    (of DADO (valorDado 5)(juego oca))
    (of DADO (valorDado 6)(juego oca))
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