(defclass elemento (is-a USER)
    (slot numero(type INTEGER))
)
(defrule regla-sumar1
    ?a <- (object (is-a elemento) (numero ?x))
    ?b <- (object (is-a elemento) (numero ?y))
    =>
    ?x = (+ ?x ?y)
    (printout ?x)
)
(definstances hechos-iniciales
    (of elemento (numero -10))
    (of elemento (numero 5))
)