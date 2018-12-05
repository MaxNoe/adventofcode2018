module Day4
using Dates
export parse_input
export build_sleep_map
export part_1

function parse_input(input::String)
    rows = split(strip(input), "\n")
    guard_info = map(row -> begin

        date_str, rest = split(row, "]")
        date_str = lstrip(date_str, '[')
		date = DateTime(date_str, "y-m-d H:M")

        asleep = occursin("asleep", row)
        awake = occursin("wakes up", row)

        guard_match = match(r"Guard #(\d+)", row)
        if guard_match != nothing
            guard = parse(Int, guard_match[1])
        else
            guard = -1
        end
        return (date, guard, asleep, awake)
    end, rows)
    return sort(guard_info)
end


function build_sleep_map(guard_info)
	current_guard = -1
	asleep_since = DateTime(2018, 1, 1)

	sleep_map::Dict{Int, Dict{Int, Int}} = Dict()
	
	for (date, guard, asleep, awake) in guard_info
		if guard >= 0
			current_guard = guard
			if !in(guard, keys(sleep_map))
				sleep_map[guard] = Dict()
			end
		end

		if asleep
			asleep_since = date
		end

		if awake
			for cur_min in minute(asleep_since):minute(date) - 1
				if !in(cur_min, keys(sleep_map[current_guard]))
					sleep_map[current_guard][cur_min] = 0
				end
				sleep_map[current_guard][cur_min] += 1
			end
		end
	end
	return sleep_map	
end

function part_1(sleep_map)
	total_sleep = Dict(
		guard=>sum(values(sleep))
		for (guard, sleep) in sleep_map
	)
	minutes_asleep, guard = findmax(total_sleep)
	times, most_sleepy_minute = findmax(sleep_map[guard])
	return guard * most_sleepy_minute
end

end
