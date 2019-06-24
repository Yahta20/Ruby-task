puts ("-=Candies=-")
#Taking the value for candy
print ("Input weight of candy: ")
str = gets
str.chomp!
x= str.to_i
puts("weight of candy = "+x.to_s)
#Taking the value for tenderine
print ("Input weight of tenderine: ")
str = gets
str.chomp!
y = str.to_i
puts("weight of tenderine = "+y.to_s)
#Taking the value for apple
print ("Input weight of apple: ")
str = gets
str.chomp!
z = str.to_i
puts("weight of apple = "+z.to_s)
#Taking the value for total weight
print ("Input weight of total weight: ")
str = gets
str.chomp!
w = str.to_i
puts("total weight = "+w.to_s)
#checking the total mass for compliance with the requirements of the problem and logic
#any of values could not be more then total weight
if w<x or w<y or w<z then
	puts("Oops, something wrong in inputs")
	exit
end

#checking the total mass for compliance with the requirements of the problem and logic
#any of values cannot be zero  
if w<=0 or 0<=y or 0<=z or w<=0 then
	puts("Oops, something wrong in inputs")
	exit
end

#creating variable for result
res=0
#semi-brute-force search for all posible result
for i in 0..(w/z) do#all posible result for apple
	for j in 0..(w/y) do#all posible result for tenderine
		for k in 0..(w/x) do#all posible result for candy
			#calculate option of mass 
			mass = k*x+j*y+i*z
			#mass comparison
			if mass == w then
				res +=1
			end
			#elimination of unnecessary calculations
			if mass > w then
				break
			end
		end
	end
end
#showing results
puts ("\nResult  = "+res.to_s)
exit





