using AdventOfCode2018
using AdventOfCode2018.Day7

input = get_aoc_input(7)
parsed_input = parse_input(input)
dag = build_dag(parsed_input)

println("Solution 1: ", part_1(dag))
println("Solution 2: ", part_2(dag, workers=5, per_task=60))
