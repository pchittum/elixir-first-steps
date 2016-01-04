defmodule Getter do



	def do_file_get(name) do
		case File.read(name) do
			#match the :ok atom in tuple if success
			{:ok, fileText} ->
				"The file was read: #{fileText}"
			#match the :error atom in the tuple if failure
			{:error, err} -> 
				"There was a file read error: #{err}"
			#simple variable will always match, so works perfectly as a
			#"else" or default path
			other ->
				"An unkown error occurred. #{other}"
		end
	end
	
end