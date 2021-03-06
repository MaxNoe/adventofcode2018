module test_3

using AdventOfCode2018.Day3
using Test

testinput = """#1 @ 1,3: 4x4
#2 @ 3,1: 4x4
#3 @ 5,5: 2x2
"""

@testset "day 3, part 1" begin
	rectangles = parse_input(testinput)

	@test rectangles[1].id == 1
	@test rectangles[2].id == 2
	@test rectangles[3].id == 3

	@test rectangles[1].left == 1
	@test rectangles[2].left == 3
	@test rectangles[3].left == 5

	@test rectangles[1].top == 3
	@test rectangles[2].top == 1
	@test rectangles[3].top == 5

	@test rectangles[1].width == 4
	@test rectangles[2].width == 4
	@test rectangles[3].width == 2

	@test rectangles[1].height == 4
	@test rectangles[2].height == 4
	@test rectangles[3].height == 2

	used_patches = build_used_patches(rectangles)
	@test part_1(used_patches) == 4
end

@testset "day 3, part 2" begin
	rectangles = parse_input(testinput)
	used_patches = build_used_patches(rectangles)
	@test part_2(rectangles, used_patches) == 3
end

end
