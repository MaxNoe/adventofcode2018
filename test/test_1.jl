using AdventOfCode2018.Day1

@testset "day 1" begin

@test parse_input("+1\n-2\n3\n+1") == [1, -2, 3, 1]

@test part_1([1, 1, 1]) == 3
@test part_1([1, 1, -2]) == 0
@test part_1([-1, -2, -3]) == -6

end
