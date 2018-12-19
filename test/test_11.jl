module test_11
using AdventOfCode2018.Day11
using Test

@testset "day 11, part 1" begin

    @test power_level(122, 79, 57) == -5
    @test power_level(217, 196, 39) == 0
    @test power_level(101, 153, 71) == 4

    @test part_1(18) == (33, 45, 29)
    @test part_1(42) == (21, 61, 30)
end

@testset "day 11, part 2" begin
    @test part_2(18) == (90, 269, 16, 113)
    @test part_2(42) == (232, 251, 12, 119)
end

end

