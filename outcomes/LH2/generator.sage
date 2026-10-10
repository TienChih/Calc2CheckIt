class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import definite_integral
        from sage.symbolic.integration.integral import indefinite_integral
        var("u power k p")
        
        
        


        Functions = [sin(k*x), tan(k*x), arcsin(k*x), arctan(k*x), e^(k*x)-1, ln(1+k*x), 1-cos(k*sqrt(x))]

        shuffle(Functions)

        f(k,x) = Functions[0]

        p0 = randrange(1,7)/2
        cf = randrange(1,11)

        scenario = randrange(0,2)

        if scenario == 0:
            thelimit = limit(f(cf, x^p0)/x^p0, x=0, dir="plus")
            a = 0
            directionsymbol = r"+"

        if scenario == 1:
            p0 = p0*-1
            thelimit = limit(f(cf, x^p0)/x^p0, x=oo, )
            a = r"\infty"
            directionsymbol = r" "
            



        
        
        

        

        return {
            "fx":f(cf,x^p0), 
            "gx":x^p0,            
            "p0": p0,
            "thelimit": thelimit,
            "a": a,
            "directionsymbol": directionsymbol,
            
            
        }
        
        
    
      
        
        
            
           
