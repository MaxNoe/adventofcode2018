using AdventOfCode2018.Day2

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

	@test has_two(test_input[0]) == false
	@test has_three(test_input[0]) == false
	@test has_two(test_input[1]) == true
	@test has_three(test_input[1]) == true
	@test has_two(test_input[2]) == true
	@test has_three(test_input[2]) == false

	@test part_1(test_input) == 12
end
