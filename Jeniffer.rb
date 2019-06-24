puts ("-=Secretary Jeniffer=-")

#Taking the value for amount of copies
print ("Input amount of copies: ")
str = gets
str.chomp!
n= str.to_i

#Taking the value of time for Xerox #1
print ("Time for copy on Xerox №1: ")
str = gets
str.chomp!
x = str.to_i

#Taking the value of time for Xerox #2
print ("Time for copy on Xerox №2: ")
str = gets
str.chomp!
y = str.to_i

#Creating variable for next calculation
res=0  #variable of results


if n<=0 then
	#Finish program if no copies
	puts("Easy day for Jeniffer")
	exit
end

if (x<0 or x==0) and (y<0 or y==0)then
	#Finish program if inputs negative or zero
	puts ("All Xerox are broken")
	exit
end

if (x<0 or x==0) and (y>0)then
	#Finish program if inputs of x negative or zero
	res=y*n
	puts ("Result = "+res.to_s)
	exit
end

if (y<0 or y==0) and (x>0)then
	#Finish program if inputs of x negative or zero
	res=x*n
	puts ("Result = "+res.to_s)
	exit
end

if x==y then
	#case when time is equal 
	res+=x
	if (n-1)%2==0 then
		#calculation in case number of remaining copies is even
		res += ((n-1)/2)*x
		puts ("\nResult = "+res.to_s)
		exit
	end
	if (n-1)%2==1 then 
		#calculation in case number of remaining copies is odd
		res += ((n-1)/2)*x
		res += x
		puts ("\nResult = "+res.to_s)
		exit
	end
end

fast=0 #variable for faster xerox
slow=0 #variable for slower xerox

#definition of fast and slow Xerox
if x>y then
	fast = y
	slow = x
else 
	fast = x
	slow = y
end

#creating a copy on fast Xerox for the second
res+=fast

#Amount of time for faster Xerox
time1 = (n-1)*fast

#Calculation of amount of copies in half part of previous variable
kopis  = (((time1/2)/slow)+1).to_i
kopif  = (n-1)-kopis

while true do
	#Calculation of time for fast and slow xerox
	
	times = kopis*slow
	timef = kopif*fast
	
	puts ("Times "+times.to_s+" \tTimef "+timef.to_s+" \tSlow kopi "+kopis.to_s+" \tFast kopi "+kopif.to_s)
	#case when variables are equal
	if times==timef then 
		res += timef
		#showing results
		puts ("\nResult = " + res.to_s)
		break
		exit
	end 
	#case when variables finite iteration condition
	if times>=timef+fast-slow then
		if times >timef then
			res += times
			#showing results
			puts ("\nResult = "+res.to_s)
			exit
		else
			res += timef
			#showing results
			puts ("\nResult = "+res.to_s)
			exit
		end
	end
	#Optimize time by changing copies on printers
	kopis+=1
	kopif-=1
end

