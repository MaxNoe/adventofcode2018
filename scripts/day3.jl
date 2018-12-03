using AdventOfCode2018
using AdventOfCode2018.Day3

input = get_aoc_input(3)
rectangles = parse_input(input)
used_patches = build_used_patches(rectangles)

println("Solution 1: ", part_1(used_patches))
