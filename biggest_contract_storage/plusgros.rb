#!/usr/bin/env ruby

class Contract
	def initialize addr, nslots, codesize
		@addr = addr
		@nslots = nslots.to_i
		@codesize = codesize.to_i
	end

	def size
		@nslots * 32 + @codesize
	end

	def <=>(other)
		size <=> other.size
	end

	def to_s
		"Address: #{@addr} size=#{self.size}"
	end
end

liste = []

STDIN.each_line do |line|
	addr, nslots, codesize = line.split
	contract = Contract.new(addr, nslots, codesize)

	if liste.length >= 10
		min = liste.min
		if min.size < contract.size
			#idx = liste.find_index(min)
			liste.delete(min)
			liste << contract
		end	
	else
		liste << contract
	end
end

liste.sort!

liste.each do |x|
	puts x
end
