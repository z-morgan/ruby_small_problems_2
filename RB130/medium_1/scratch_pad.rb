def some_method(arg1, *arg2)
end

some_method(1, 2, 3) #=> arg2 will be assigned to [2, 3]
some_method(1, 2)    #=> arg2 will be assigned to [2]
some_method(1)       #=> arg2 gets assigned to []

#----------------------------------------------------

def some_method(arg1, arg2)
end

some_method(1, [2, 3]) #=> arg2 is [2, 3]
some_method(1, *[2, 3]) #=> ArgumentError: 3 passed, 2 expected

#----------------------------------------------------

var1, var2 = [1, 2, 3]  #=> var1 is 1, var2 is 2
var1, var2 = *[1, 2, 3] #=> var1 is 1, var2 is 2
var1, var2 = 1 or [1]   #=> var1 is 1, var2 is nil
*var1, var2 = [1, 2, 3] #=> var1 is [1, 2], var2 is 3

#----------------------------------------------------

[1, 2, 3].tap { |arg1, arg2| }  #=> arg1 is 1, arg2 is 2
[1, 2, 3].tap { |*arg1, arg2| } #=> arg1 is [1, 2], arg2 is 3
[1].tap { |arg1, arg2| }        #=> arg1 is 1, arg2 is nil



