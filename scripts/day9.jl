using AdventOfCode2018
using AdventOfCode2018.Day9

input = get_aoc_input(9)
players, max_points = parse_input(input)

println("Solution part 1: ", part_1(players, max_points))
println("Solution part 1: ", part_1(players, max_points * 100))
