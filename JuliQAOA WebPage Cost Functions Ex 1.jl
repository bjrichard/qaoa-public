using JuliQAOA, Graphs

g = SimpleGraph(5)

edges = [(1,2), (1,4), (2,3), (2,5), (3,5), (4,5)];

for edge in edges
    add_edge!(g, edge[1], edge[2])
end

maxcut(g, [0, 0, 1, 1, 1])

weights = Dict((1,2)=>4,(1,4)=>2,(2,3)=>1,(2,5)=>3,(3,5)=>3,(4,5)=>1);

maxcut(g, [0, 1, 0, 0, 1]; weights=weights)

#bisection(G::SimpleGraph, x; weights=Dict())

bisection(g, [0, 1, 0, 0, 1]; weights=weights)
