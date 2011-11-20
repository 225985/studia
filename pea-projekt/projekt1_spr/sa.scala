def apply(s0: T) = {
        def inner(bestState: T, oldState: T, t: Double): T = {
            if(t < Tmin) oldState
            else {
                val newState = S(oldState)
                val (a,b) = if(F(newState) < F(oldState)){
                    if(F(newState) < F(bestState)) (newState, newState)
                    else (bestState, newState)
                } else if (math.random < P(oldState, newState, t)){
                    (bestState, newState)
                } else {
                    (bestState, oldState)
                }
                inner(a, b, T(t))
            }
        }

        inner(s0, s0, Tmax)

    }