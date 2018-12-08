module Day5
export is_reacting
export apply_reaction
export part_1
export part_2

function is_reacting(input::AbstractString)
	for i in 1:length(input) - 1
		a, b = input[i], input[i + 1]
		if a != b
			if islowercase(a) & (a == lowercase(b))
				return true
			elseif isuppercase(a) & (a == uppercase(b))
				return true
			end
		end
	end
	return false
end

function apply_reaction(input::AbstractString; count=1)
	for i in 1:length(input) - 1
		a, b = input[i], input[i + 1]
		if a == b
			continue
		end

		if (islowercase(a) & (a == lowercase(b))) | (isuppercase(a) & (a == uppercase(b)))
			return replace(input, (a * b) => ""; count=count)
		end
	end
	return input
end

function part_1(input::AbstractString)
	last = ""
	reacted = apply_reaction(input)
	while last != reacted
		last = reacted
		reacted = apply_reaction(reacted, count=length(input))
	end
	return length(reacted)
end

function part_2(input::AbstractString)
	polymers = collect(Set(lowercase(input)))

	return minimum(map(p -> begin
		without_p = replace(input, p => "")
		without_p = replace(without_p, uppercase(p) => "")
		return part_1(without_p)
	end, polymers))
end

end
