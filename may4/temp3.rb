
ary = [1,2,3,4,5,1]
ary_amended = []
ary.each do |y|
	unless ary_amended.include?(y)	
		ary_amended.push(y) 
	end
end
puts ary_amended

