class Generator(BaseGenerator):
    def data(self):
        from sage.symbolic.integration.integral import definite_integral
        
        theta = var('t', latex_name=r"\theta")
        r=var("r")
        x=var("x")
        y=var("y")

        ass1= randrange(-8, -5)
        ass2 = randrange(-2,3)
        ass3 = randrange(6, 9)
        
        root1 = randrange(ass1+1, ass2)
        root2 = randrange(ass2+1, ass3)

        f(x) = 3*(x-root1)^randrange(0,3)* (x-root2)^randrange(0,3)* choice([-1,1])/( (x-ass1)^randrange(1,3) * (x-ass2)^randrange(1,3) * (x-ass3)^randrange(1,3) )

        scenario = randrange(0,1)

        if scenario == 0:
            start = randrange(ass1+1, ass2)
            cut1 = randrange(ass2+1, ass3)
            cut2 = randrange(ass3+1, ass3+5)
            lim1 = ass2
            lim2 = ass3
            end = r"\infty"

       
            return {
                "right": True,
                "ass1": ass1 ,
                "ass2": ass2 ,
                "ass3": ass3 ,
                "fx": f(x),
                "lim1": lim1 ,
                "lim2": lim2 ,
                "end": end ,
                "start": start ,
                "cut1": cut1 ,
                "cut2": cut2 ,
            }

        if scenario == 1:
            end = randrange(ass2+1, ass3)
            cut2 = randrange(ass1+1, ass2)
            cut1 = randrange(ass1-5, ass1-1)
            start = r"-\infty"
            lim1 = ass1
            lim2 = ass2
            

       
            return {
                "left": True,
                "ass1": ass1 ,
                "ass2": ass2 ,
                "ass3": ass3 ,
                "fx": f(x),
                "lim1": lim1 ,
                "lim2": lim2 ,
                "end": end ,
                "start": start ,
                "cut1": cut1 ,
                "cut2": cut2 ,
            }    
        
        
        
        

        

    @provide_data
    def graphics(data):
        plot1 = plot(data["fx"], (x,-10,data["ass1"]-0.001), ymin=-10, ymax=10 )
        plot2 = plot(data["fx"], (x,data["ass1"]+0.001, data["ass2"]-0.001), ymin=-10, ymax=10 )
        plot3 = plot(data["fx"], (x,data["ass2"]+0.001, data["ass3"]-0.001), ymin=-10, ymax=10)
        plot4 = plot(data["fx"], (x,data["ass3"]+0.001, 10),  ymin=-10, ymax=10)
        return {
            "plot": plot1 + plot2 + plot3 + plot4
        }
        
