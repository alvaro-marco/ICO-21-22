(defclass SESION (is-a USER)
    (slot nombreJuego (type SYMBOL)(allowed-values oca rayuela))
    (slot nombreBambino (type STRING))
)
(defclass JUGADOR (is-a USER)
    (slot rondasGanadas (type INTEGER)(default 0))
    (slot posicion (type INTEGER)(default 0))
)
(defclass BAMBINO (is-a JUGADOR)
    (slot nombre (type STRING))
    (slot saludo (type STRING))
    (slot personalidad (type SYMBOL)(allowed-values timido torpe))
    (slot estado (type SYMBOL)(allowed-values normal llorando escondido gritando)(default normal))
)
(defclass ROBOT (is-a JUGADOR)
    (slot ayudasRealizadas (type INTEGER)(default 0))
)
(defclass LISTAREACCIONES)
    (slot estado (type SYMBOL))
    (slot reaccion (type STRING))
    (slot nombreJuego (type SYMBOL))
    (slot fase (type SYMBOL))
    ;; (slot personalidad (type SYMBOL))
)
(defclass LISTAPERSONALIDADES
    (slot adaptadoA (type SYMBOL))
    (slot saludo (type STRING))
    (slot reglas (type STRING))
)

(defclass JUEGO (is-a USER)
    (slot nombre (type SYMBOL)(allowed-values oca rayuela))
    (slot maxCasillas (type INTEGER))
    (slot rondas (type INTEGER))
)

(defclass CASILLA (is-a USER)
    (slot nombreJuego (type SYMBOL))
    (slot tipo (type SYMBOL)(allowed-values normal inicial final espera retrocede avanza piedra)(default normal))
    (slot posicion (type INTEGER)(range 0 40))
    (slot nuevoValorDado (type INTEGER)(default 0))
)

(defclass TURNO (is-a USER)
    (slot fase (type SYMBOL)(allowed-values saludo cambioTurno tirada movimiento fin)) 
    (slot valorDado (type INTEGER)(range 1 8)
    (slot jugador (type SYMBOL)
)

(defclass DADO (is-a USER)
    (slot valorDado (type INTEGER)(range 1 8))
)

