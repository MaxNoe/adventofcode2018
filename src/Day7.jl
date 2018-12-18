module Day7
export parse_input, build_dag, part_1

pattern = r"Step (\w) must be finished before step (\w) can begin"

function parse_input(input::String)::Array{Array{String, 1}, 1}
    return map(
        l -> match(pattern, l).captures,
        split(strip(input), "\n")
    )
end

function build_dag(parsed_input::Array{Array{String, 1}, 1})
    dag = Dict{String, Array{String}}()
    for (dependency, target) in parsed_input
        if !in(target, keys(dag)) 
            dag[target] = [dependency]
        else
            push!(dag[target], dependency)
        end

        if !in(dependency, keys(dag))
            dag[dependency] = []
        end
    end
    return dag
end


function part_1(dag)
    order = ""
    while length(dag) > 0
        possible = collect(filter(k -> length(dag[k]) == 0, keys(dag)))
        sort!(possible)

        next = possible[1]
        pop!(dag, next)
        order *= next

        for dependencies in values(dag)
            filter!(l -> l != next, dependencies)
        end
    end
    return order
end

end
