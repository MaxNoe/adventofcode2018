module test_4

using AdventOfCode2018.Day4
using Test
using Dates

test_input = """[1518-11-01 00:00] Guard #10 begins shift
[1518-11-01 00:05] falls asleep
[1518-11-01 00:25] wakes up
[1518-11-01 00:30] falls asleep
[1518-11-01 00:55] wakes up
[1518-11-01 23:58] Guard #99 begins shift
[1518-11-02 00:40] falls asleep
[1518-11-02 00:50] wakes up
[1518-11-03 00:05] Guard #10 begins shift
[1518-11-03 00:24] falls asleep
[1518-11-03 00:29] wakes up
[1518-11-04 00:02] Guard #99 begins shift
[1518-11-04 00:36] falls asleep
[1518-11-04 00:46] wakes up
[1518-11-05 00:03] Guard #99 begins shift
[1518-11-05 00:45] falls asleep
[1518-11-05 00:55] wakes up
"""

parsed_input = [
	(DateTime(1518, 11, 01, 00, 00), 10, false, false),
	(DateTime(1518, 11, 01, 00, 05), -1, true, false),
	(DateTime(1518, 11, 01, 00, 25), -1, false, true),
	(DateTime(1518, 11, 01, 00, 30), -1, true, false),
	(DateTime(1518, 11, 01, 00, 55), -1, false, true),
	(DateTime(1518, 11, 01, 23, 58), 99, false, false),
	(DateTime(1518, 11, 02, 00, 40), -1, true, false),
	(DateTime(1518, 11, 02, 00, 50), -1, false, true),
	(DateTime(1518, 11, 03, 00, 05), 10, false, false),
	(DateTime(1518, 11, 03, 00, 24), -1, true, false),
	(DateTime(1518, 11, 03, 00, 29), -1, false, true),
	(DateTime(1518, 11, 04, 00, 02), 99, false, false),
	(DateTime(1518, 11, 04, 00, 36), -1, true, false),
	(DateTime(1518, 11, 04, 00, 46), -1, false, true),
	(DateTime(1518, 11, 05, 00, 03), 99, false, false),
	(DateTime(1518, 11, 05, 00, 45), -1, true, false),
	(DateTime(1518, 11, 05, 00, 55), -1, false, true),
]


@testset "day 3, part 1" begin

	parsed = parse_input(test_input)
	@test parsed == parsed_input
	
	map = build_sleep_map(parsed)
	@test part_1(map) == 240
	@test part_2(map) == 4455
	
end

end
