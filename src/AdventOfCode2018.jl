module AdventOfCode2018

include("get_input.jl")

for day in 1:11
	include("Day$day.jl")
end

include("Day16.jl")

end
