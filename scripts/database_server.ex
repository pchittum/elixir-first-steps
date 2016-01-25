defmodule DatabaseServer do

	# startup spawns new process
	def start do
		#spawn process, init state, run the loop recursion
		spawn(fn ->
			connection = :random.uniform(1000)
			loop(connection)
		end)

		# original spawn
		# spawn(&loop/0)
	end

	# loop run receive block in recursive function call
	defp loop(connection) do
		receive do # if message sends matching message 
			{:run_query, from_pid, query_def} -> 
				query_result = run_query(connection, query_def)
				send(from_pid, {:query_result, query_result})
		end

		#tail call optimization - jump and go again
		loop(connection)
	end
	
	# example: send message to self
	# this sets it in the incoming process queue
	def run_async(server_pid, query_def) do
		send(server_pid, {:run_query, self, query_def})		
	end

	# look for result in queue
	def get_result do
		receive do
			{:query_result, result} -> result
		after 5000 -> 
			{:error, :timeout}
		end
	end

	# updates run_query with connection
	defp run_query(connection, query_def) do
		:timer.sleep(2000)
		"Connection #{connection}: #{query_def} result"
	end

	# simulated long-running query
	defp run_query(query_def) do
		:timer.sleep(2000)
		"#{query_def} result"
	end

end