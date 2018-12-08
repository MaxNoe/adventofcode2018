module test_5

using AdventOfCode2018.Day5
using Test


@testset "day 5, part 1" begin
	@test is_reacting("aA") == true
	@test is_reacting("abBA") == true
	@test is_reacting("abAB") == false
	@test is_reacting("aabAAB") == false

	@test apply_reaction("abBA") == "aA"
	@test apply_reaction("dabAcCaCBAcCcaDA") == "dabAaCBAcCcaDA"
	@test apply_reaction("dabCBAcCcaDA") == "dabCBAcaDA"
	@test part_1("dabAcCaCBAcCcaDA") == 10
end

end
