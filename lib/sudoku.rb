require_relative 'solver'

puzzle_path = ARGV[0]
puzzle_text = File.read(puzzle_path).gsub("\n", "").gsub(" ", "0").chars
solver = Solver.new(puzzle_text)
solver.solve
