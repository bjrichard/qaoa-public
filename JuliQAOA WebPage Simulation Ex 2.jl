using JuliQAOA, Graphs, LinearAlgebra

n = 6

# 3 rounds with random angles
p = 3 
angles = rand(2*p)

# transverse field mixer
mixer = mixer_x(n) 

# calculate the MaxCut cost function over all basis states on a random G(n,p) graph
g = erdos_renyi(n, 0.5)
obj_vals = [maxcut(g, x) for x in states(n)]

# the traditional expectation value
exp_value(angles, mixer, obj_vals)

# the probability of observing an optimal state
measure = obj_vals .== maximum(obj_vals)
exp_value(angles, mixer, obj_vals, measure)

# the probability of observing an optimal state starting from a random initial state
sv = rand(2^n) + rand(2^n)*im
sv = sv/norm(sv)
exp_value(sv, angles, mixer, obj_vals, measure)