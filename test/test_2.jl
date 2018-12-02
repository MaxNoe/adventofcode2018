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
end
