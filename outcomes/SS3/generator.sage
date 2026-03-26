class Generator(BaseGenerator):
    def data(self):
        var('k n i j')
        
        numerator = randrange(1,6)
        denominator = numerator + randrange(1,4)
        ratio = Rational(numerator/denominator*choice([-1,1]))
        k1 = randrange(5)
        coefficient = randrange(2,6)
        summand1 = coefficient*ratio^k
        closedform1 = coefficient*(ratio^k1 - ratio^(n+1))/(1-ratio)
        limit1 = coefficient*ratio^k1/(1-ratio)

        tasks=[{
            "k0": k1,
            "summand": summand1,
            "closedform": closedform1,
            "limit": limit1,
        }
        ]

        a = randrange(1,6)
        b = randrange(1,6)
        c = randrange(2,4)

        f(k) = a/(k+b)
        g(k) = a/(k+b+c)

        summand2 = f(k)-g(k)
        k2 = randrange(0,5)

        closedform2 = 0

        for i in range(c):
            closedform2 += f(k2+i)
        for i in range(c):
            closedform2 += -1*g(n+i)    

        limit2 = sum(f(k2+j), j, 0, c-1)

        tasks +=[{
            "k0": k2,
            "summand": summand2.factor(),
            "closedform": closedform2.expand(),
            "limit": limit2,
        }
        ]

        shuffle(tasks)

        

        return {"tasks": tasks}
