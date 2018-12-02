module Day2

export parse_input
export part_1

function parse_input(input::String)
	ids = split(input)
	return ids
end

function check_id(id::Union{String, SubString{String}})
	has_two = false
	has_three = false
	for chr in Set{Char}(id)
		if has_two & has_three
			break
		end
		n = 0
		for other in id
			if chr == other
				n += 1
			end
		end
		has_two = (n == 2) | has_two
		has_three = (n == 3) | has_three
	end

	return has_two, has_three
end


function part_1(ids::Union{Array{String}, Array{SubString{String}}})
	n_two = 0
	n_three = 0
	for id in ids
		has_two, has_three = check_id(id)
		n_two += has_two
		n_three += has_three
	end

	return n_two * n_three
end

end
