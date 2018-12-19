module Day11
export power_level, part_1, part_2

function power_level(x::Int, y::Int, serial::Int)
    rack_id = x + 10
    power = rack_id * (rack_id * y + serial)
    power = div(power, 100) % 10
    return power - 5
end

function part_1(serial::Int)::Tuple{Int, Int, Int}
    power_grid = [power_level(x, y, serial) for x in 1:300, y in 1:300]

    max_power = 0
    best_x = -1
    best_y = -1
    for x in 1:298
        for y in 1:298
            power = 0
            for dx in 0:2
                for dy in 0:2
                    power += power_grid[x + dx, y + dy]
                end
            end
            if power > max_power
                best_x = x
                best_y = y
                max_power = power
            end
        end
    end

    return best_x, best_y, max_power
end


function part_2(serial::Int)::Tuple{Int, Int, Int, Int}
    power_grid = [power_level(x, y, serial) for x in 1:300, y in 1:300]

    max_power = 0
    best_x = -1
    best_y = -1
    best_n = -1
    for n in 1:300
        for x in 1:(300 - n - 1)
            for y in 1:(300 - n - 1)
                power = 0
                for dx in 0:(n - 1)
                    for dy in 0:(n - 1)
                        power += power_grid[x + dx, y + dy]
                    end
                end
                if power > max_power
                    best_x = x
                    best_y = y
                    best_n = n
                    max_power = power
                end
            end
        end
    end

    return best_x, best_y, best_n, max_power
end

end
