module Day1

function parse_input(input::String)
	nums = split(input)
	return map(x -> parse(Int, x), nums)
end

function part_1(numbers::Array{Int})
	return sum(numbers)
end

export parse_input
export part_1
end
