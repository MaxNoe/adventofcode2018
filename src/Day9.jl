module Day9
using DataStructures
export parse_input, part_1

function parse_input(input::String)::Tuple{Int, Int}
    m = match(r"(\d+) players; last marble is worth (\d+) points", input)
    return tuple(map(x -> parse(Int, x), m.captures)...)
end


function rotate!(deque::Deque, times::Int)
    if times < 0
        for i in 1:abs(times)
            pushfirst!(deque, pop!(deque))
        end
    else
        for i in 1:times
            push!(deque, popfirst!(deque))
        end
    end
end


function part_1(players, max_points)::Int
    marbles = Deque{Int}()
    push!(marbles, 0)
    points = zeros(Int, players)

    for value in 1:max_points
        if value % 23 == 0
            player = mod1(value, players)
            points[player] += value

            rotate!(marbles, -7)
            points[player] += pop!(marbles)
            rotate!(marbles, 1)
        else
            rotate!(marbles, 1)
            push!(marbles, value)
        end
    end

    return maximum(points)
end

end
