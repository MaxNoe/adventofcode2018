using AdventOfCode2018
using AdventOfCode2018.Day8

input = get_aoc_input(8)
numbers = parse_input(input)
tree = build_tree(numbers)

println("Solution part 1: ", part_1(tree))
println("Solution part 2: ", part_2(tree))
