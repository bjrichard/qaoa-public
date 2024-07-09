using JuliQAOA, Graphs

g = SimpleGraph(5)

edges = [(1,2), (1,4), (2,3), (2,5), (3,5), (4,5)];

for edge in edges
   add_edge!(g, edge[1], edge[2])
end

kvertex_cover(g, [1, 0, 1, 0, 1])