println("Imports")
using AdventOfCode2018
using AdventOfCode2018.Day4

println("getting input")
input = get_aoc_input(4)

println("start stuff")
guard_info = parse_input(input)
sleep_map = build_sleep_map(guard_info)

println("Solution 1: ", part_1(sleep_map))
