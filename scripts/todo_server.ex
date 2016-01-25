defmodule TodoServer do

	def start do
		spawn(fn -> loop(TodoList.new) end)
	end

	def add_entry(todo_server, new_entry) do
		send(todo_server, {:add_entry, new_entry})
	end

	defp loop(todo_list) do
		new_todo_list = receive do
			message -> process_message(todo_list, message)
		end

		loop(new_todo_list)
	end

	defp process_message(todo_list, {:add_entry, new_entry}) do
		TodoList.add_entry(todo_list, new_entry)
	end
	
end

defmodule TodoList do

	defstruct auto_id: 1, entries: HashDict.new

	def new, do: %TodoList{}
	 	
	def add_entry(
		%TodoList{entries: entries, auto_id: auto_id} = todo_list,
		entry
		) do

		entry = Map.put(entry, :id, auto_id)
		new_entries = HashDict.put(entries, auto_id, entry)

		%TodoList{todo_list | entries: new_entries, auto_id: auto_id + 1}
			
	end	

	def entries(%TodoList{entries: entries}, date) do
		entries
		|> Stream.filter(fn({_, entry}) -> 
			entry.date == date
			end)
		|> Enum.map(fn({_, entry}) -> 
			entry
			end)
		
	end
		
end