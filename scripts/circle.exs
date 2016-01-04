defmodule Circle do

	@moduledoc """
	Implements basic circle functions using pi to the 5th precision:

	- `area/1` Calculate area of circle based on radius
	- `circumference/1` Calculate circumference of circle based on radius

	"""
	#this is a module attribute
	@pi 3.14159

	@doc """
	## Name

	`area/1`

	## Description
	
	Calculate area of a circle based on a radius value

	## Usage

	    Circle.area(4)
	    50.26544
	"""
	
	#this is a typespec: assigns a static type for testing
	#look into dialyzer
	@spec area(number) :: number
	def area(r), do: r * r * @pi
	#above is a single line function

	@doc """
	## Name
	
	`circumference/1`

	## Description
	
	Calculate outer circumference of a circle based on a radius value

	## Usage

	    Circle.circumference(4)
	    25.13272
	"""
	@spec circumference(number) :: number
	def circumference(r), do: 2 * @pi * r

end