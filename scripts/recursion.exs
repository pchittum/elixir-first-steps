defmodule Recursion do
	
	@doc """
	if called as: length([1,2,3,4])
	private functions will be called as: 
	length([1,2,3,4], 0)
	length([2,3,4], 1)
	length([3,4], 2)
	length([4], 3)
	length([], 4) <-- this is the base case that returns the count finally

	allowed owing to tail-call optimization
	- if a function calls itself as its last operation, the function will only take up a single space on the function stack
	- this works *only* if the **last** thing the function does is call itself
	- be certain you are doing this...there are ways to kill yourself
	"""

#this is not using tail-call optimization...last thing in
#function needs to be called for that to happen. eventually
#this could blow up your memory by pushing too much onto the stack
	def natural_nums(1), do: IO.puts(1)
	def natural_nums(n) do
		natural_nums(n-1)
		IO.puts(n)
	end

	def fact(0), do: 1
	def fact(x), do: x * fact(x-1)

	def length(list) do

		count = 0
		do_length(list, count)
	end

	defp do_length([], count) do
		count
	end

	defp do_length([ _ | tail], count) do
		do_length( tail , count + 1)
	end

	def reverse(list) do
		do_reverse(list,[])
	end

	defp do_reverse([], new_list) do
		new_list
	end

	defp do_reverse([head|tail], new_list) do
		prepended = [head | new_list]
		do_reverse(tail, prepended)
	end

	@doc """
	take list and sum all parts
	"""
	def sum_list(list) do
		sum_list(list, 0)
	end

	defp sum_list([], total) do
		total
	end

	defp sum_list([head|tail],current_total) do
		sum_list(tail, current_total + head)
	end

	@doc """
	apply function to each element of a list
	"""
	def reduce(list, fun, accumulator) do

		do_reduce(list, fun, accumulator)
		
	end

	defp do_reduce([], _fun, result) do
		result
	end

	defp do_reduce([head|tail], fun, current_total) do
		result = fun.(head, current_total)
		do_reduce(tail, fun, result)
	end

	@doc """
	for instance iterate through the tuple list
		[{"Owen",4},{"Jon",8}]
	"""
	def map(list_of_things, fun) do
		do_map(list_of_things, fun, [])
	end

	defp do_map([], _fun, list_to_ret) do
		reverse(list_to_ret)
	end

	defp do_map([head|tail], fun, list_to_ret) do
		result = fun.(head)
		list_to_ret = [result | list_to_ret]
		do_map(tail, fun, list_to_ret)
	end

	@doc """
	take each item of the list and do something with it
	"""
	def each([], _fun) do
		:ok
	end

	def each([head|tail], fun) do
		fun.(head)
		each(tail, fun)
	end

end