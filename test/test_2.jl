module test_2

using AdventOfCode2018.Day2
using Test

@testset "day 2, part 1" begin
	@test parse_input("ab\nbc\ncd\nbr") == ["ab", "bc", "cd", "br"]

	test_input = [
		"abcdef",
		"bababc",
		"abbcde",
		"abcccd",
		"aabcdd",
		"abcdee",
		"ababab",
    ]

	@test Day2.check_id(test_input[1]) == (false, false)
	@test Day2.check_id(test_input[2]) == (true, true)
	@test Day2.check_id(test_input[3]) == (true, false)

	@test part_1(test_input) == 12
end

@testset "day 2, part 2" begin
	test_input = [
		"abcde",
		"fghij",
		"klmno",
		"pqrst",
		"fguij",
		"axcye",
		"wvxyz",
    ]

	@test Day2.is_similar(test_input[1], test_input[2]) == false
	@test Day2.is_similar(test_input[2], test_input[5]) == true
	@test Day2.get_common(test_input[2], test_input[5]) == "fgij"

	@test part_2(test_input) == "fgij"
end
end
