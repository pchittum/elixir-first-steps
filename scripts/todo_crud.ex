defmodule TodoList do

	defstruct auto_id: 1, entries: HashDict.new

	def new, do: %TodoList{}
	 	
	def add_entry(
		%TodoList{entries: entries, auto_id: auto_id} = todo_list,
		entry
		) do

		entry = Map.put(entry, :id, auto_id)
		new_entries = HashDict.put(entries, auto_id, entry)

		#IO.puts(todo_list)
		#IO.puts(new_entries)
		#IO.puts(auto_id)

		%TodoList{todo_list | entries: new_entries, auto_id: auto_id + 1}
			
	end	

	def update_entry(
		%TodoList{entries: entries} = todo_list,
		entry_id,
		updater_fun
		) do
		#this little guy uses the entry_id value to get the number! duh!
		case entries[entry_id] do
			nil -> todo_list

			old_entry -> 
				new_entry = updater_fun.(old_entry)
				new_entries = HashDict.put(entries, new_entry.id, new_entry)
				%TodoList{todo_list | entries: new_entries}
		end

		
	end

	def entries(%TodoList{entries: entries}, date) do
		entries
		|> Stream.filter(fn({_, entry}) -> 
			#IO.puts(entry.date)
			#IO.puts(date)
			entry.date == date
			end)
		|> Enum.map(fn({_, entry}) -> 
			entry
			end)
		
	end
		
end