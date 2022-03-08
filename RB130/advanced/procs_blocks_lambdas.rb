# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc   #=> proc objectid
puts my_proc.class  #=> Proc
my_proc.call  #=> This is a .    proc is called with 'thing' being nil
my_proc.call('cat')  #=> This is a cat.
my_proc.call('cat', 'dog') #=> This is a cat.

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class #=> Proc   Both of these are lambda's which are a type of Proc object
my_lambda.call('dog')
my_second_lambda.call('horse')
# my_lambda.call   #=> Throws ArgumentError
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }  #=> Throws NameError, Lambda is not a class

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."} #=> This is a .  'seal' evaluates to nil
# block_method_1('seal')  #=> LocalJumpError, b/c no block given

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

=begin
Procs and Blocks both have lenient arity. They don't care if you pass them the correct number
of arguments. 
Lambdas have strict arity. You must pass them the correct number of args. Also<
lambdas are a special type of Proc object. 