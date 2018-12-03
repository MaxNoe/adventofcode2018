module AdventOfCode2018

export Day1
export Day2
export Day3

include("get_input.jl")


for day in 1:3
	include("Day$day.jl")
end

end
