using HTTP

URL = "https://adventofcode.com/"

function get_aoc_input(day::Int, year::Int=2018)
	url = URL * string(year) * "/day/" * string(day) * "/input"
	session = ENV["AOC_SESSION"]
	header = ("Cookie", "session=" * session)
	response = HTTP.get(url, headers=[header])
	return String(response.body)
end

export get_aoc_input
