module Day6
export parse_input, part_1, part_2

function parse_input(input::String)
    lines = split(strip(input), "\n") 
    coords = map(
        l -> map(x -> parse(Int, x), split(l, ", ")),
        lines
    )
    return hcat(coords...)'
end

function manhattan(x1, y1, x2, y2)
    return abs(x2 - x1) + abs(y2 - y1)
end


function part_1(coords)
    xmin, ymin = minimum(coords, dims=1)
    xmax, ymax = maximum(coords, dims=1)

    n_x = xmax - xmin
    n_y = ymax - ymin

    grid = zeros(Int, (n_x, n_y))

    for i in 1:n_x
        for j in 1:n_y
            x1 = i + xmin - 1
            y1 = j + ymin - 1

            min_distance = 2^31
            for k in 1:size(coords, 1)
                x2, y2 = coords[k, :]
                dist = manhattan(x1, y1, x2, y2)
                if dist < min_distance
                    grid[i, j] = k
                    min_distance = dist
                elseif dist == min_distance
                    grid[i, j] == -1
                end
            end
        end
    end

    areas = zeros(Int, size(coords, 1))
    for i in 1:n_x
        for j in 1:n_y

            if (grid[i, j] != -1) & (areas[grid[i, j]] != -1)
                if (i == 1) | (i == n_x) | (j == 1) | (j == n_y)
                    areas[grid[i, j]] = -1
                else
                    areas[grid[i, j]] += 1
                end
            end
        end
    end
    return maximum(areas)
end


function part_2(coords)
    max_total_distance = 10000
    xmin, ymin = minimum(coords, dims=1)
    xmax, ymax = maximum(coords, dims=1)

    n_x = xmax - xmin
    n_y = ymax - ymin

    grid = zeros(Int, (n_x, n_y))

    safe_size = 0

    for i in 1:n_x
        for j in 1:n_y
            x1 = i + xmin - 1
            y1 = j + ymin - 1

            total_distance = 0
            for k in 1:size(coords, 1)
                x2, y2 = coords[k, :]
                dist = manhattan(x1, y1, x2, y2)
                total_distance += dist
            end
            if total_distance < max_total_distance
                safe_size += 1
            end
        end
    end
    return safe_size
end

end
