module Day2

export parse_input
export part_1
export part_2

function parse_input(input::String)
	ids = split(input)
	return ids
end

function check_id(id::AbstractString)
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


function part_1(ids::Array{<:AbstractString})
	n_two = 0
	n_three = 0
	for id in ids
		has_two, has_three = check_id(id)
		n_two += has_two
		n_three += has_three
	end

	return n_two * n_three
end


function is_similar(id1::AbstractString, id2::AbstractString)
	n_different = 0
	for (a, b) in zip(id1, id2)
		if a != b
			n_different += 1
		end
		if n_different > 1
			return false
		end
	end
	return return true
end

function get_common(id1::AbstractString, id2::AbstractString)
	common = ""
	for (a, b) in zip(id1, id2)
		if a == b
			common *= a
		end
	end
	return common
end

function part_2(ids::Array{<:AbstractString})
	ids_to_check = copy(ids)
	while length(ids_to_check) > 0
		id_to_check = pop!(ids_to_check)
		for other in ids_to_check
			if is_similar(id_to_check, other)
				return get_common(id_to_check, other)
			end
		end
	end
end


end
