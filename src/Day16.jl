module Day16
export parse_input, part_1, part_2


struct Instruction
	opcode::Int
	A::Int
	B::Int
	C::Int
end

function Base.parse(::Type{Instruction}, input::AbstractString)::Instruction
    opcode, A, B, C = map(x -> parse(Int, x), split(input))
    return Instruction(opcode, A, B, C)
end

struct Example
	before::Array{Int, 1}
	instruction::Instruction
	after::Array{Int, 1}
end

function Base.parse(::Type{Example}, input::AbstractString)::Example
	before, instruction, after = split(input, "\n")
    return Example(
        parse_register(before),
        parse(Instruction, instruction),
        parse_register(after),
    )
end


function parse_register(register::AbstractString)
    m = match(r"\[(\d+), (\d+), (\d+), (\d+)\]", register)
	return map(x -> parse(Int, x), m.captures)
end


function parse_input(input::AbstractString)
	part1, part2 = split(input, "\n\n\n")

	example_strings = split(part1, "\n\n")

    examples = map(x -> parse(Example, x), example_strings)

    test_program = map(x-> parse(Instruction, x), split(strip(part2), "\n"))

    return examples, test_program
end


function part_1(examples)
    n_geq_3 = 0
    for example in examples
        n_fitting = 0
        for operation! in operations
            if test_operation(operation!, example.before, example.after, example.instruction)
                n_fitting += 1
            end
        end

        if n_fitting >= 3
            n_geq_3 += 1
        end
    end

    return n_geq_3
end


function part_2(examples, test_program)
    opcodes = derive_opcode_meaning(examples)
    return execute_program(test_program, opcodes)[1]
end


function execute_program(program, opcodes)
    register = zeros(Int, 4)
    for instruction in program
        opcodes[instruction.opcode](register, instruction)
    end
    return register
end

function test_operation(operation!, before, after, instruction)
    register = copy(before)
    operation!(register, instruction)
    return register == after
end


function derive_opcode_meaning(examples)
    opcodes = Dict(i => copy(operations) for i in 0:15)

    for example in examples
        opcode = example.instruction.opcode 
        filter!(
            o -> test_operation(o, example.before, example.after, example.instruction),
            opcodes[opcode],
        )
    end

    unknown = opcodes
    known = Dict()

    while !all(length(o) == 1 for o in values(opcodes)) 
        for (opcode, possible) in unknown
            if length(possible) == 1
                operation =  possible[1]
                known[opcode] = operation
                pop!(unknown, opcode)

                for (opcode, possible) in unknown
                    filter!(x -> x != operation, possible)
                end
            end
        end
    end

    return known
end


function addr!(register::Array{Int}, inst::Instruction)
    register[inst.C + 1] = register[inst.A + 1] + register[inst.B + 1]
end

function addi!(register::Array{Int}, inst::Instruction)
    register[inst.C + 1] = register[inst.A + 1] + inst.B
end

function mulr!(register::Array{Int}, inst::Instruction)
    register[inst.C + 1] = register[inst.A + 1] * register[inst.B + 1]
end

function muli!(register::Array{Int}, inst::Instruction)
    register[inst.C + 1] = register[inst.A + 1] * inst.B
end

function banr!(register::Array{Int}, inst::Instruction)
    register[inst.C + 1] = register[inst.A + 1] & register[inst.B + 1]
end

function bani!(register::Array{Int}, inst::Instruction)
    register[inst.C + 1] = register[inst.A + 1] & inst.B
end

function borr!(register::Array{Int}, inst::Instruction)
    register[inst.C + 1] = register[inst.A + 1] | register[inst.B + 1]
end

function bori!(register::Array{Int}, inst::Instruction)
    register[inst.C + 1] = register[inst.A + 1] | inst.B
end


function setr!(register::Array{Int}, inst::Instruction)
    register[inst.C + 1] = register[inst.A + 1]
end

function seti!(register::Array{Int}, inst::Instruction)
    register[inst.C + 1] = inst.A
end


function gtir!(register::Array{Int}, inst::Instruction)
    register[inst.C + 1] =  inst.A > register[inst.B + 1]
end

function gtri!(register::Array{Int}, inst::Instruction)
    register[inst.C + 1] = register[inst.A + 1] > inst.B
end

function gtrr!(register::Array{Int}, inst::Instruction)
    register[inst.C + 1] = register[inst.A + 1] > register[inst.B + 1]
end

function eqir!(register::Array{Int}, inst::Instruction)
    register[inst.C + 1] = inst.A == register[inst.B + 1]
end

function eqri!(register::Array{Int}, inst::Instruction)
    register[inst.C + 1] = register[inst.A + 1] == inst.B
end

function eqrr!(register::Array{Int}, inst::Instruction)
    register[inst.C + 1] = register[inst.A + 1] == register[inst.B + 1]
end


operations = [addr!, addi!, mulr!, muli!, banr!, bani!, borr!, bori!, setr!, seti!, gtir!, gtri!, gtrr!, eqir!, eqri!, eqrr!]


end
