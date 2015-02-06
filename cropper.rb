puts "Hopsa!"


class AnsiReader

	def initialize input
		@input = input
		@pos = 0
	end

	def has_next
		return @pos < @input.length
	end

	def next
		if @input[@pos] != "["
			char = @input[@pos]
			@pos +=1
			return char
		end

		code_buffer = ""
		char = nil
		while @pos < @input.length && char != "m" do
			char = @input[@pos]
			@pos += 1
			code_buffer += char
		end
		return "#{code_buffer}#{@input[@pos]}"
	end
end

def crop(input, width)
	reader = AnsiReader.new input
	output = ""
	width.times do
		if reader.has_next
			output += reader.next
		end
	end
	return output
end

log = File.read("log.txt")
lines = log.split("\n")
lines.each do |line| 
	puts crop(line, 40)
end
