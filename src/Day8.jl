module Day8
export Node, parse_input, build_tree, part_1

struct Node
    metadata::Array{Int, 1}
    children::Array{Node}
end
Node(; metadata=[], children=[]) = Node(metadata, children)
Base.:(==)(x::Node, y::Node) = (x.metadata == y.metadata) & (x.children == y.children)



function parse_input(input::String)::Array{Int, 1}
    return reverse(map(x -> parse(Int, x), split(input)))
end


function build_tree(numbers::Array{Int, 1})::Node
    
    node = Node()
    n_children = pop!(numbers)
    n_metadata = pop!(numbers)

    for i in 1:n_children
        push!(node.children, build_tree(numbers))
    end

    for i in 1:n_metadata
        push!(node.metadata, pop!(numbers))
    end

    return node

end

function part_1(tree::Node)::Int
    total = sum(tree.metadata)
    for child in tree.children
        total += part_1(child)
    end
    return total
end


end
