
def destutter(ary)
	x=0
	ary_amended =[]
	ary.each do |y|
		if x!=y
			ary_amended.push(y)
		end
	x=y
	end
puts ary_amended
end

destutter [1, 2, 3, 3, 4, 4, 3, 2, 1, 1]
