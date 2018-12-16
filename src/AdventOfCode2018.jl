module AdventOfCode2018

export Day1
export Day2
export Day3
export Day4

include("get_input.jl")


for day in 1:4
	include("Day$day.jl")
end

include("Day10.jl")
include("Day16.jl")

end
