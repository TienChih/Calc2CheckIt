class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import indefinite_integral
        var('k n i j t c')
        
        
        

    

        tasks = []

        #Finite

        a = randrange(-5,6)

        distractions = [ randrange(1,6)*(n+randrange(1,4))^randrange(1,4), 
        randrange(1,6)*n^randrange(1,4)+randrange(1,4), 
        ln(randrange(1,6)*n+randrange(2,6)),
        sqrt(randrange(1,6)*n^randrange(1,6)+randrange(2,6)),
        ]

        shuffle(distractions)
        Values = [2,3,4,5,6,7,8,9]
        shuffle(Values)
        shifts = [0, randrange(1,6)]
        shuffle(shifts)
        actualstuff = [(Values[0]+shifts[0])^(n)/(Values[1]+shifts[1])^(n), ( factorial(n)/n^(n))^choice([1,-1])  ]
        shuffle(actualstuff)

        C(n)=1
        C(n) = C(n)*(distractions[0])^choice([-1,1])*actualstuff[0]
        Ca(n) = C(n)

        C(n) = C(n)*choice([-1,1]) ^n


        summand(n, x) = C(n)*(x-a)^n

        Ratio = Ca(n+1)/Ca(n)

        R = 1/limit(Ratio, n, oo, algorithm="giac")

        Rbound = a + R
        Lbound = a - R

        # Right
        Rlimit = sum(Ratio*R^n, n, 1, oo, algorithm="giac")

        if Rlimit < oo and Rlimit != "undef":
            Rtext = "converges"
            Rsymbol = r"\Big]"
        else:
            Rtext = "diverges"
            Rsymbol = r"\Big)"

        # Left
        Llimit = sum(Ratio*(-1*R)^n,  n, 1, oo, algorithm="giac")

        if Llimit < oo and Llimit != "undef":
            Ltext = "converges"
            Lsymbol = r"\Big["
        else:
            Ltext = "diverges"
            Lsymbol = r"\Big("    
        
        
        

        tasks+=[{
            "summand": summand(n,x),
            "Bnp1": summand(n+1,x).simplify(),
            "Bn": summand(n,x).simplify(),
            "Bnr": (1/summand(n,x)).simplify(),
            "Ratio":Ratio.simplify,
            "R":R,
            "Rtest": summand(n,x+R),
            "Rlimit": Rlimit,
            "Rtext": Rtext,
            "Ltest": summand(n,x-R),
            "Llimit": Llimit,
            "Ltext": Ltext,
            "Rpoint": a+R,
            "Lpoint": a-R,
            "finite": True,
        }
        ]
        
        shuffle(tasks)

        

        return {"tasks": tasks}



