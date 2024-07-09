
using JuliQAOA
using Graphs

"""
Note: that this example does not work. There is an issue with the simulate function, 
which I have yet to figure out. I commented the problematic lines and replaced them 
by the likely correct ones that can be found.... 
=#
"""

# define graph
n=6
graph = erdos_renyi(n, 0.5)

# calculate objective values across basis states
obj_vals = [maxcut(graph, x) for x in states(n)]

# generate mixer, [1] indicates \sum_i X_i
mixer = mixer_x(n,[1]) # BR: there is a typo in 2312.06451 where they have mixer_X([1],n)
p = 3 # number of rounds
angles = rand(2*p)
# angles[1:p] = betas, angles[p+1:2*p] = gammas # BR: also commented in 2312.0645

#=
# PROBLEMATIC: 
res = simulate(angles, mixer, obj_vals) # BR: Returns an error
exp_value = get_exp_value(res) # BR: Returns an error

# Note: I couldn't find simulate() in the source code.
=#

# Calculate the statevector (with |ψ0⟩ = uniform superposition over all states)
statevector(angles, mixer, obj_vals) # BR: technically simulate was meant to return 
                                     # the statevector so maybe this does the same 
                                     # as the previous two lines (to be investigated)

