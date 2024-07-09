using JuliQAOA, Graphs, LinearAlgebra

"""
'Calculates the QAOA statevector with the custom initial state |psi_0> = sv.
"""

n = 6

# 3 rounds with random angles
p = 3 
angles = rand(2*p)

# transverse field mixer
mixer = mixer_x(n)

# calculate the MaxCut cost function over all basis states on a random G(n,p) graph
g = erdos_renyi(n, 0.5)
obj_vals = [maxcut(g, x) for x in states(n)]

# calculate the statevector (with |ψ0⟩ = uniform superposition over all states)
statevector(angles, mixer, obj_vals)

# calculate the statevector (with |ψ0⟩ = random initial state)
sv = rand(2^n) + rand(2^n)*im
sv = sv/norm(sv)
statevector(sv, angles, mixer, obj_vals) # BR: statevector! does the same but stores the result in sv