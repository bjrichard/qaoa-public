using JuliQAOA
using Graphs

n = 6
graph = erdos_renyi(n,0.5)

k = 3
obj_vals = [densest_ksubgraph(graph, x) for x in dicke_states(n, k)]
mixer = mixer_clique(n,k)
#mixer = mixer_clique(n,k; file="path/to/saved/mixer") # BR: "if the included file path exists, the pre-computed mixer is loaded."