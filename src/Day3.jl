module Day3

export parse_input
export build_used_patches
export part_1
export part_2

struct Rectangle
    id::Int
    left::Int
    top::Int
    width::Int
    height::Int
end


function Rectangle(m::RegexMatch)
	id, left, top, width, height = map(x -> parse(Int, x), m.captures)
	return Rectangle(id, left, top, width, height)
end


function parse_input(input::AbstractString)::Array{Rectangle}
	re = r"#(\d+) @ (\d+),(\d+): (\d+)x(\d+)"
	return map(l -> Rectangle(match(re, l)), split(strip(input), "\n"))
end


function build_used_patches(rectangles::Array{Rectangle})

	patches_used = Dict{Tuple{Int, Int}, Int}()
	for rectangle in rectangles
		for w in 0:rectangle.width - 1
			for h in 0:rectangle.height - 1
				x = rectangle.left + w
				y = rectangle.top + h
				if !in((x, y), keys(patches_used))
					patches_used[(x, y)] = 0
				end
				patches_used[(x, y)] += 1
			end
		end
	end	
	return patches_used
end

function part_1(patches_used::Dict{Tuple{Int, Int}, Int})
	return count(x -> x > 1, values(patches_used))
end

function part_2(rectangles::Array{Rectangle}, patches_used::Dict{Tuple{Int, Int}, Int})

	for rectangle in rectangles
		alone = true
		for w in 0:rectangle.width - 1
			if !alone
				break
			end
			for h in 0:rectangle.height - 1
				x = rectangle.left + w
				y = rectangle.top + h
				if patches_used[(x, y)] > 1
					alone = false
					break
				end
			end
		end
		if alone
			return rectangle.id
		end
	end	
end


end
