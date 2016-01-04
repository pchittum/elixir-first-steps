defmodule Geometry do 

@moduledoc """
Geometrical math
"""


@doc """

"""

	def rectangle_area(a, b) do
		a * b
	end


	def rectangle_area(a) do
		rectangle_area(a, a)
	end

	def sum(a, b \\ 0) do
		a + b
	end

end