puts ("-=Sloboda Friends=-")

#Taking the value of workers
print ("Input number of people: ")
str = gets
str.chomp!
n= str.to_i

#Taking the value of specific worker
print ("Input specific number of people: ")
str = gets
str.chomp!
s = str.to_i

#result if n is negative or zero
if n<=0 then
	puts("Nobody works here")
	exit
end
#result if s is negative or zero or bigger then n
if s<=0 or s>n then
	puts ("Oops, something wrongs in inputs")
	exit
end

#creating amount of friends
frends = 0

while true do
	if frends==0 then
			#amount of friends cannot be equal as n
			frends = rand(n-1)
			
			if frends>=1 then
			#finish if amount at least 1
				break
			end
	end
end

#creating array of relations for outputing zero and ones
ars = Array.new(n,0)
for i in 0..n-1 do
	ars[i] = Array.new(n,0)
end

##creating array of relations for outputing (who is friends with whom by numbers)
frnd = Array.new(frends,0)

for i in 0..frends-1 do
	frnd[i] = Array.new(2,0)
	#guaranteed friend of our specific person
	if i==0 then 
		frnd[i][0]=s-1
		frnd[i][1]=-1
		while true do	
			if frnd[i][1]==-1 then
				frnd[i][1] = rand(n)
				#guaranteed friend is not our specific person
				if frnd[i][1]!=s-1 then
					break
				end
				frnd[i][1]=-1
			end
		end
	else
	#making list of friendship
	#taking friend of last couple
		frnd[i][0]=frnd[i-1][1]#<===============here=============<
		frnd[i][1]=-1#creating of vacant position
		f1rn = []# creating array friends of persons from line 69^
		for a in 0..i do#cheking his frends
			if frnd[a][0]==frnd[i][0] then
				f1rn<<frnd[a][1]
			end
			if frnd[a][1]==frnd[i][0] then
				f1rn<<frnd[a][0]
			end
		end
		while true do
			#creating new friend
			if frnd[i][1]==-1 then
				frnd[i][1] = rand(n)
				ecv=false
				#friend's uniqueness check
				for a in 0..i do
					if frnd[i][1] == f1rn[a]
						ecv=true
					end
				end
				# if number of new friend is unique 	
				if !ecv and frnd[i][1]!=frnd[i][0] then
				#then finish here
					break
				end
			frnd[i][1]=-1	
			end
		end
	end
end

for i in 0..frends-1 do
	#make matrix of relations 
	ars[frnd[i][0]][frnd[i][1]] = 1
	ars[frnd[i][1]][frnd[i][0]] = 1
	#for beter visualization
	#ars[s-1][s-1] = "x"
end
# outputing matrix on the screen
print ("Matrix= ")
for i in 0..n-1 do
	for j in 0..n-1 do
		print (ars[i][j].to_s+"\t")
	end
	print ("\n\t")
end
# outputing result
puts ("\n"+"Results : "+ (frends).to_s)
exit