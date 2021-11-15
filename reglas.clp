(defrule Saludo
    (object (is-a SESION) (nombreJuego ?j) (nombreBambino ?b))
    (object (is-a LISTAPERSONALIDADES (adaptadoA ?pers) (saludo ?s))
    (object (is-a BAMBINO)(personalidad ?pers)))
    =>
    (printout  s  crlf)
    
)













  (defrule r-ACTIVIDAD-2
  (object (is-a A-2-ENTRADA) (entrada ?e) (salida ?s) (recurso ?r) (entrada-2 ?e2) (duracion ?d))
  (object (is-a RECURSO) (nombre ?r) (estado on))
  ?pr1<- (object (is-a PRODUCTO) (nombre ?e))
  ?pr2<- (object (is-a PRODUCTO) (nombre ?e2))
  ?dur <- (tiempo ?t)
  =>
  (retract ?dur)
  (assert (tiempo (+ ?t ?d)))
  (unmake-instance ?pr1 ?pr2)
  (make-instance of PRODUCTO-ELABORADO (nombre ?s))
  (printout t "Los productos " ?e ", " ?e2 " se transforman en " ?s crlf)
  (printout t "El proceso lleva " (+ ?t ?d) " horas" crlf))