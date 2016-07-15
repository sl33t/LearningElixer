defmodule Elixerprograms do
	def main(args) do
		args |> parse_args |> process
	end
	
	def process([]) do
		IO.puts "No arguments given" <>
				"\n\t Options: --program, --input"
	end
	
	def process(options) do
		program = "#{options[:program]}"
		input = "#{options[:input]}"
		
		case program do
			"reversestring" -> IO.puts recursive_reverse(input)
			"palindrome" -> IO.puts palindrome(input)
			_ -> IO.puts "No program specified." <>
						 "\n\t Option: --program" <>
						 "\n\t Values: reversestring" <>
						 "\n\t Values: palindrome"
		end
	end
	
	defp parse_args(args) do
		{options, _, _} = OptionParser.parse(
							args, 
							switches: [
								input: :input,
								program: :program
							]
						  )
		options
	end
	
	def palindrome(input) do
		cond do
			recursive_reverse(input) == input -> "Is palindrome"
			true -> "Not palindrome"
		end
	end
	
	def recursive_reverse(input) do
		recursive_reverse(input, "")
	end
	
	def recursive_reverse("", reverse_string) do
		reverse_string
	end
	
	def recursive_reverse(input, reverse_string) do
		recursive_reverse(
			String.slice(input, 0, String.length(input) - 1),
			reverse_string <> String.last(input)
		)
	end
end
