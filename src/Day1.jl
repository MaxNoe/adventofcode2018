module Day1

export parse_input
export part_1
export part_2

function parse_input(input::String)
	nums = split(input)
	return map(x -> parse(Int, x), nums)
end

function part_1(numbers::Array{Int})
	return sum(numbers)
end

function part_2(numbers::Array{Int})
	current_frequency = 0
	visited_frequencies = Set()
	idx = 1
	while !in(current_frequency, visited_frequencies)
		push!(visited_frequencies, current_frequency)
		current_frequency += numbers[idx]
		idx = mod1(idx + 1, length(numbers))
	end
	return current_frequency
end

end
