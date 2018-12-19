module test_8
using AdventOfCode2018.Day8
using Test

test_input = "2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2\n"
numbers  = reverse([2, 3, 0, 3, 10, 11, 12, 1, 1, 0, 1, 99, 2, 1, 1, 2])
tree = Node(metadata=[1, 1, 2], children=[
    Node(metadata=[10, 11, 12]),
    Node(metadata=[2], children=[Node(metadata=[99])])
])



@testset "day 8, part 1" begin
	@test parse_input(test_input) == numbers
    @test build_tree(numbers) == tree
    @test part_1(tree) == 138
    @test part_2(tree) == 66

end


end
