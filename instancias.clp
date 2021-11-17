(definstances jugador
    (of ROBOT)
    (of BAMBINO (nombre Giuseppe)(saludo "Hola, bichito")(personalidad timido))
    (of BAMBINO (nombre Franchesca)(saludo "General Kenoby")(personalidad torpe))
)
(definstances juegos
    (of JUEGO (nombre oca)(maxCasillas 40)(rondas 1))
    (of JUEGO (nombre rayuela)(maxCasillas 6)(rondas 3))
)

;; Definimos las intancias en las que se especifica cuales son las interacciones del robot
(definstances listaReacciones
    (of LISTAREACCIONES (estado "Llorando")(reaccion "Ea, ea, a llorar a la llorería")(nombreJuego oca)(fase cambioTurno))
    (of LISTAREACCIONES (estado "Escondido")(reaccion "No te escondas, ¡qué no pasa nada!")(nombreJuego oca)(fase cambioTurno))
    (of LISTAREACCIONES (estado "Gritando")(reaccion "Vamos a tranquilizarnos, respira conmigo, uuuuuuufff aaaaaaafff uuuuuuuuf affffff")(nombreJuego oca)(fase cambioTurno))
    (of LISTAREACCIONES (estado "Gritando")(reaccion "Vamos a tranquilizarnos, respira conmigo, uuuuuuufff aaaaaaafff uuuuuuuuf affffff")(nombreJuego oca)(fase movimiento))
    (of LISTAREACCIONES (estado "Tirado")(reaccion "No pasa nada porque te hayas caído, inténtalo otra vez, que ya verás que esta vez lo consigues")(nombreJuego rayuela)(fase movimiento))
)

    ;;POR HACERRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR


)
(definstances listaPersonalidades
    (of LISTAPERSONALIDADES (adaptadoA timido) (saludo "(Hablando más bajo que el estándar y despacio) ¡Hola pequeñín! Vamos a jugar a ") (juego oca)(reglas "En este juego se tira el dado y dependiendo de la casilla en la que se caiga al sumar el valor del dado se queda uno donde está, se avanza, se retrocede o se pierde turno. El que llegue a la Oca final antes gana el juego. "))

)
    ;;POR HACERRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
)

;; Definimos las instancias para las casillas de los dos juegos y el dado
(definstances dado ;; El dado representa tanto la tirada del dado de oca y el lanzamiento de la piedra en la rayuela
    (of DADO (valorDado 1))
    (of DADO (valorDado 2))
    (of DADO (valorDado 3))
    (of DADO (valorDado 4))
    (of DADO (valorDado 5))
    (of DADO (valorDado 6))
    (of DADO (valorDado 7)) ;; Los valores a partir de 6 se considerán fallos
    (of DADO (valorDado 8))
)
(definstances casillaRayuela ;; El valor piedra se definirá en la tirada de cada jugador
    (of CASILLA (tipo normal)(posicion 0)(nombreJuego rayuela))
    (of CASILLA (tipo normal)(posicion 1)(nombreJuego rayuela))
    (of CASILLA (tipo normal)(posicion 2)(nombreJuego rayuela))
    (of CASILLA (tipo normal)(posicion 3)(nombreJuego rayuela))
    (of CASILLA (tipo normal)(posicion 4)(nombreJuego rayuela))
    (of CASILLA (tipo normal)(posicion 5)(nombreJuego rayuela))
    (of CASILLA (tipo normal)(posicion 6)(nombreJuego rayuela))
    (of CASILLA (tipo normal)(posicion 7)(nombreJuego rayuela))
)
(definstances casillaOca
    (of CASILLA (tipo normal)(posicion 0)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 1)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 2)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 3)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 4)(nombreJuego oca))
    (of CASILLA (tipo avanza)(nuevoValorDado 5)(posicion 5)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 6)(nombreJuego oca))
    (of CASILLA (tipo avanza)(nuevoValorDado 7)(posicion 7)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 8)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 9)(nombreJuego oca))
    (of CASILLA (tipo avanza)(nuevoValorDado 5)(posicion 10)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 11)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 12)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 13)(nombreJuego oca))
    (of CASILLA (tipo retrocede)(nuevoValorDado -7)(posicion 14)(nombreJuego oca))
    (of CASILLA (tipo avanza)(nuevoValorDado 5)(posicion 15)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 16)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 17)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 18)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 19)(nombreJuego oca))
    (of CASILLA (tipo avanza)(nuevoValorDado 5)(posicion 20)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 21)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 22)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 23)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 24)(nombreJuego oca))
    (of CASILLA (tipo avanza)(nuevoValorDado 5)(posicion 25)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 26)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 27)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 28)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 29)(nombreJuego oca))
    (of CASILLA (tipo avanza)(nuevoValorDado 5)(posicion 30)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 31)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 32)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 33)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 34)(nombreJuego oca))
    (of CASILLA (tipo avanza)(nuevoValorDado 5)(posicion 35)(nombreJuego oca))
    (of CASILLA (tipo retrocede)(nuevoValorDado 36)(posicion 36)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 37)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 38)(nombreJuego oca))
    (of CASILLA (tipo normal)(posicion 39)(nombreJuego oca))
    (of CASILLA (tipo final)(posicion 40)(nombreJuego oca))
)