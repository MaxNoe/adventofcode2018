module test_7
using AdventOfCode2018.Day7
using Test

test_input = """Step C must be finished before step A can begin.
Step C must be finished before step F can begin.
Step A must be finished before step B can begin.
Step A must be finished before step D can begin.
Step B must be finished before step E can begin.
Step D must be finished before step E can begin.
Step F must be finished before step E can begin.
"""

parsed_input = [
    ["C", "A"],
    ["C", "F"],
    ["A", "B"],
    ["A", "D"],
    ["B", "E"],
    ["D", "E"],
    ["F", "E"],
]

dag = Dict(
    "A" => ["C"],
    "B" => ["A"],
    "C" => [],
    "D" => ["A"],
    "E" => ["B", "D", "F"],
    "F" => ["C"],
)

@testset "day 7, part 1" begin
	@test parse_input(test_input) == parsed_input
    @test build_dag(parsed_input) == dag
	@test part_1(dag) == "CABDFE"
	@test part_2(dag) == 15
end

end
