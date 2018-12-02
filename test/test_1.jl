module test_1
using AdventOfCode2018.Day1
using Test

@testset "day 1, part 1" begin
	@test parse_input("+1\n-2\n3\n+1") == [1, -2, 3, 1]

	@test part_1([1, 1, 1]) == 3
	@test part_1([1, 1, -2]) == 0
	@test part_1([-1, -2, -3]) == -6
end

@testset "day 1, part 2" begin
	@test part_2([1, -1]) == 0
	@test part_2([3, 3, 4, -2, -4]) == 10
	@test part_2([-6, 3, 8, 5, -6]) == 5
	@test part_2([7, 7, -2, -7, -4]) == 14
end
end
