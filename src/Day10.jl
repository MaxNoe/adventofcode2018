module Day10
export parse_input
export find_min_area

import PyPlot

function parse_input(input::String)
    lines = split(strip(input), '\n')
    position = reshape(Int[], 0, 2)
    velocity = reshape(Int[], 0, 2)
    for line in lines
       m = match(r"position=<( *-?\d+), *(-?\d+)> velocity=< *(-?\d+), *(-?\d+)>", line)
       data = map(x -> parse(Int, x), m.captures)
       position = [position; [data[1] data[2]]]
       velocity = [velocity; [data[3] data[4]]]
    end

    return position, velocity
end


function find_min_area(positions, velocities)
    current_area::Int64 = 2^62
    last_area::Int64 = 2^62
    t = -1
    while current_area <= last_area
        positions .+= velocities 
        t += 1
        width = maximum(positions[:, 1]) - minimum(positions[:, 1])
        height = maximum(positions[:, 2]) - minimum(positions[:, 2])
        last_area = current_area
        current_area = width * height
    end

    println(t)
    positions .-= velocities

    PyPlot.axis("equal")
    PyPlot.scatter(positions[:, 1], -positions[:, 2])
    PyPlot.show()
end

end
