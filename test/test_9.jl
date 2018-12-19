module test_9
using AdventOfCode2018.Day9
using Test

@testset "day 8, part 1" begin
    @test parse_input("10 players; last marble is worth 1618 points") == (10, 1618)
    @test part_1(10, 1618) == 8317
    @test part_1(13, 7999) == 146373
    @test part_1(17, 1104) == 2764
    @test part_1(21, 6111) == 54718
    @test part_1(30, 5807) == 37305
end


end

