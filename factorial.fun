letrec f = fun 0 -> 1
           |   x -> x * f(x - 1)
in f 4
