class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import indefinite_integral
        var('k n i j t c')
        
        
        

        scenarios = ["ratio"] # ["ratio", "root"]
        shuffle(scenarios)

        tasks = []

        #Ratio
        distractions = [ randrange(1,6)*(n+randrange(1,4))^randrange(1,4), 
        randrange(1,6)*(n+randrange(1,4))^randrange(1,4), 
        sqrt(randrange(1,6)*n^randrange(1,3)+randrange(1,6)),
        ln(randrange(1,6)*n^randrange(1,4)+randrange(1,6)),
        arctan(randrange(1,3)*n+randrange(1,6))
        ]

        shuffle(distractions)

        number = randrange(1,3)

        a(n)=1
        for i in range(number):
            a(n) = a(n)*(distractions[i])^choice([-1,1]) * choice([-1,1])

        A = randrange(2,6)
        B = randrange(A+1, A+6)
        C = randrange(1,3)

        Ratios = [ A^n, (Rational(B/A))^n, factorial(n)/B^n, n^(C*n)/(factorial(n))^C, n^n/B^n, n^(C*n)/factorial(C*n) ]
        shuffle(Ratios)
        
        if scenarios[0] == "ratio":
            a(n) = A(n)* (Ratios[0])^(-1)
            converges = True
            diverges = False
        else:
            a(n) = a(n)* (Ratios[0])
            diverges = True
            converges = False

        
        ar(n) = 1/a(n)
        combine = abs(a(n+1)/a(n))    

        Lim = limit(combine, n, oo)

        tasks+=[{
            "an": a(n),
            "anp1": a(n+1),
            "ar": ar(n),
            "combine": combine,
            "converges":converges,
            "diverges":diverges,
            "limit": Lim,
            "ratio": True,
        }
        ]
        
        
        
        
        shuffle(tasks)

        

        return {"tasks": tasks}



