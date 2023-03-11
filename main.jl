
l = [[2],[1],[4],[3]] 
vu = [false for i in 1:size(l)[1]] 

struct Node
    value::Int64
    next::Node
end

function visit(node)
    for n in l[node]
        if vu[n] == false
            vu[n] = true
            push!(components[size(components)[1]],n)
            visit(n)
        end
    end
end

components = [[]]

ne = [1,2,3,4]
for n in ne
    visit(n)
    if sum(vu) == size(vu)[1]
        break
    end
    push!(components,[])
end

ret = []
t = []
for t in components
    if size(t)[1] != 0
        push!(ret,t)
    end
end

println(ret)
