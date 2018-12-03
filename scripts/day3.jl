println("Imports")
using AdventOfCode2018
using AdventOfCode2018.Day3

println("getting input")
input = get_aoc_input(3)

println("start stuff")
rectangles = parse_input(input)
used_patches = build_used_patches(rectangles)

println("Solution 1: ", part_1(used_patches))
println("Solution 2: ", part_2(rectangles, used_patches))
