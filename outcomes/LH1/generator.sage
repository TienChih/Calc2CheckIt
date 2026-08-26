class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import definite_integral
        from sage.symbolic.integration.integral import indefinite_integral
        var("u")
        
        
        
        
        tasks = []

        # First One

        LIMS = [True,  False]
        shuffle(LIMS)

        scenario1 = randrange(0,3)

        
        if scenario1 == 0:
            
            C = [-5,-4,-3,-2,2,3,4,5]
            shuffle(C)

            c1 = C[0]

            actuallimit = LIMS[0]
            if actuallimit:
                c2 = c1
            else:
                c2 = C[1]    

            a = randrange(1,6)

            f(x) = c1*x/(x-a)-c2/ln(x/a)  


            directionchoice = randrange(0,2)

            if directionchoice == 0:
                direction = "plus"
                directionsymbol = r"+"
            else:
                direction = "minus"
                directionsymbol = r"-"      

            thelimit = limit(f(x), x=a, dir=direction)
             

            tasks+=[{
                "fx":f(x),
                "a": a,
                "thelimit": thelimit,
                "direction": direction,
                "directionsymbol": directionsymbol,
                
            }
            ]

        if scenario1 == 1:
            
            P = [1,2]
            shuffle(P)

            p1 = P[0]

            C = Rational(randrange(1,6)/randrange(1,6))

            actuallimit = LIMS[0]
            if actuallimit:
                p2 = p1
            else:
                p2 = P[1]    

            trigtype = randrange(0,2)
            prodtype = randrange(0,2)

            if trigtype == 0:
                A = pi + randrange(0,5)*pi
                K = Rational(randrange(2,6)^choice([-1,1]))
                a = A/K
                if prodtype == 0:
                    Trig(x) = choice([sin(x), tan(x)]) 
                    f(x) = ((x-a)^p1/(Trig(K*x))^p2)^choice([-1,1])
                if prodtype == 1:
                    Trig(x) = choice([csc(x), cot(x)]) 
                    f(x) = ((x-a)^p1*(Trig(K*x))^p2)^choice([-1,1]) 

            if trigtype == 1:
                A = pi/2 + randrange(0,5)*pi
                K = Rational(randrange(2,6)^choice([-1,1]))
                a = A/K
                if prodtype == 0:
                    Trig(x) = choice([cos(x), cot(x)]) 
                    f(x) = ((x-a)^p1/(Trig(K*x))^p2)^choice([-1,1])
                if prodtype == 1:
                    Trig(x) = choice([sec(x), tan(x)]) 
                    f(x) = ((x-a)^p1*(Trig(K*x))^p2)^choice([-1,1])            

            f(x) = C*f(x)*choice([-1,1])
            
            directionchoice = randrange(0,2)

            if directionchoice == 0:
                direction = "plus"
                directionsymbol = r"+"
            else:
                direction = "minus"
                directionsymbol = r"-"

            thelimit = limit(f(x), x=a, dir=direction)
             

            tasks+=[{
                "fx": f(x),
                "a": a,
                "thelimit": thelimit,
                "direction": direction,
                "directionsymbol": directionsymbol,
                
            }
            ]
        
        scenario2 =  0

        if scenario2 == 0:
            
            P = [1/2, 1, 2, 3  ]
            shuffle(P)

            p1 = P[0]

            actuallimit = LIMS[1]
            if actuallimit:
                p2 = p1
            else:
                p2 = P[1]    


            limittype = randrange(0,2)

            c1 = Rational(randrange(1,6)^choice([-1,1]))
            c2 = Rational(randrange(1,6)^choice([-1,1]))

            if limittype == 0:
                a=0
                direction = "plus"
                directionsymbol = r"+"
                f(x) = (1 + c1*x^p1  )^(c2/(x^p2) )

                thelimit = limit(f(x), x=a, dir=direction)    

            if limittype == 1:
                a= r"\infty" 
                direction = " "
                directionsymbol = r" "
                f(x) = (1 + c1/x^p1  )^(c2*(x^p2) )
                    
                thelimit = limit(f(x), x=oo, )    
             

            tasks+=[{
                "fx":f(x),
                "a": a,
                "thelimit": thelimit,
                "direction": direction,
                "directionsymbol": directionsymbol,
                
            }
            ]

        if scenario1 == 2:
            
            P = [1/2, 1, 2, 3  ]
            shuffle(P)

            p1 = P[0]

            actuallimit = LIMS[0]
            if actuallimit:
                p2 = p1
            else:
                p2 = P[1]    

            Functions = [sin(x),  tan(x), ln(1+x), arcsin(x), arctan(x)]
            g(x) = choice(Functions)


            limittype =  randrange(0,2)

            c1 = randrange(1,6)
            c2 = randrange(1,6)

            C = Rational(randrange(1,6)/randrange(1,6))

            if limittype == 0:
                a=0
                direction = "plus"
                directionsymbol = r"+"
                f(x) = C*(g(c1*x^p1)/(c2*x^p2))^choice([-1,1])

                thelimit = limit(f(x), x=a, dir=direction)    

            if limittype == 1:
                a= r"\infty" 
                direction = " "
                directionsymbol = r" "
                f(x) = C*(g(c1/x^p1)/(c2/x^p2))^choice([-1,1])
                    
                thelimit = limit(f(x), x=oo, )    
             

            tasks+=[{
                "fx":f(x),
                "a": a,
                "thelimit": thelimit,
                "direction": direction,
                "directionsymbol": directionsymbol,
                
            }
            ]    
        
        silly = randrange(0,2)

        if silly == 0:
            
            C = [-5,-4,-3,-2,2,3,4,5]
            shuffle(C)

            c1 = C[0]

            actuallimit = choice([True, False])
            if actuallimit:
                c2 = c1
            else:
                c2 = C[1]    

            A = [1,2,3,4,5]
            shuffle(A)
            a0 = A[0]
            a = A[1]

            f(x) = c1*x/(x-a0)-c2/ln(x/a0)  


            directionchoice = randrange(0,2)

            if directionchoice == 0:
                direction = "plus"
                directionsymbol = r"+"
            else:
                direction = "minus"
                directionsymbol = r"-"      

            thelimit = limit(f(x), x=a, dir=direction)
             

            tasks+=[{
                "fx":f(x),
                "a": a,
                "thelimit": thelimit,
                "direction": direction,
                "directionsymbol": directionsymbol,
                
            }
            ]

        if silly == 1:
            
            P = [1,2]
            shuffle(P)

            p1 = P[0]

            C = Rational(randrange(1,6)/randrange(1,6))

            actuallimit = choice([True, False])
            if actuallimit:
                p2 = p1
            else:
                p2 = P[1]    

            trigtype = randrange(0,2)
            prodtype = randrange(0,2)

            if trigtype == 0:
                A = pi + randrange(0,5)*pi
                K = Rational(randrange(2,6)^choice([-1,1]))
                a = (pi/choice([3,4,6]) + pi*randrange(0,2) ) /K
                if prodtype == 0:
                    Trig(x) = choice([sin(x), tan(x)]) 
                    f(x) = ((x-(A/K))^p1/(Trig(K*x))^p2)^choice([-1,1])
                if prodtype == 1:
                    Trig(x) = choice([csc(x), cot(x)]) 
                    f(x) = ((x-(A/K))^p1*(Trig(K*x))^p2)^choice([-1,1]) 

            if trigtype == 1:
                A = pi/2 + randrange(0,5)*pi
                K = Rational(randrange(2,6)^choice([-1,1]))
                a = (pi/choice([3,4,6]) + pi*randrange(0,2) ) /K
                if prodtype == 0:
                    Trig(x) = choice([cos(x), cot(x)]) 
                    f(x) = ((x-(A/K))^p1/(Trig(K*x))^p2)^choice([-1,1])
                if prodtype == 1:
                    Trig(x) = choice([sec(x), tan(x)]) 
                    f(x) = ((x-(A/K))^p1*(Trig(K*x))^p2)^choice([-1,1])            

            f(x) = C*f(x)*choice([-1,1])
            
            directionchoice = randrange(0,2)

            if directionchoice == 0:
                direction = "plus"
                directionsymbol = r"+"
            else:
                direction = "minus"
                directionsymbol = r"-"

            thelimit = limit(f(x), x=a, dir=direction)
             

            tasks+=[{
                "fx": f(x),
                "a": a,
                "thelimit": thelimit,
                "direction": direction,
                "directionsymbol": directionsymbol,
                
            }
            ]    


        shuffle(tasks)

        

        return {"tasks": tasks}
        
        
    
      
        
        
            
           
