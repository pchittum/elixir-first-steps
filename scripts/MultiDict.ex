defmodule MultiDict do
	
	def new do
	 	HashDict.new
	end 

	def get(dict, key) do
		HashDict.get(dict, key, [])
	end

	def set(dict, key, value) do
		HashDict.update(
			dict,
			key,
			[value],
			&[value | &1]
		)
	end

end