module AdventOfCode2018

include("get_input.jl")

for day in 1:4
	include("Day$day.jl")
end

for day in 6:9
	include("Day$day.jl")
end

include("Day10.jl")
include("Day16.jl")

end
