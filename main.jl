struct Node
    value::Int64
end

function newNode(value)
    Node(value)
end

#set costs to 1 for all vertices
costs = [[ 0, 5, 2, 3 ],
         [ 1, 0, 10, 2 ],
         [ 2, 30, 20, 1 ],
         [ 3, 2, 12, 0,]]

l = [[2],[1],[4],[3]] 
vu = [false for i in 1:size(l)[1]] 



function visit(node)
    for n in l[node]
        if vu[n] == false
            vu[n] = true
            push!(components[size(components)[1]],n)
            print("cost of ",node," to ",n," is ",costs[node][n],"\n")
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


