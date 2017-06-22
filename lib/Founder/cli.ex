defmodule Founder.CLI do

  def main(args) do
    args |> parse_args |> process
  end

  @doc """
  Find a file in a given path
  """
  def process({opts, filename}) do
    path = define_path(opts[:source])
    
    cond do
      File.dir?(path) -> 
        Path.wildcard("#{path}/#{filename}")
        |> print
      true -> IO.puts "Error: The given path cannot be found"  
    end
  end


  @doc """
  Print to the terminal the files with the path
  """
  def print(files) do
    for file <- files do
      IO.puts Path.absname(file) 
    end
  end

  @doc """
  Defines the absolute path for a given string/path
  If the source parameter is nil would be returned the path
  of the executable file as default `./founder -s . [filename]`.
  """
  def define_path(source) do
    cond do
      source -> Path.absname(source) 
      true -> Path.absname("")  
    end
  end

  @doc """
  Extracts the parameters given to the command.
  Returns a xx with two values:
  opts: List with the parametersvalues
  filename: name of the file to be found

  ```
  $ ./founder README   
  # find the file REAMDE without a specific extension
  
  $ ./founder -s /Users README   
  # find the file README inside the /Users folder
  ```
  """
  def parse_args(argv) do
    {opts, filename, _} = OptionParser.parse(
      argv,
      strict: [recursive: :boolean, verbose: :boolean, source: :string],
      aliases: [r: :recursive, v: :verbose, s: :source]
    )
    #TODO: OptionParse has a bug when `./founder *.exs`
    #it will parse the `filename` variable as `["mix.exs"]`, we need the raw value `*.exs`

    {opts, Enum.at(filename, 0)}
  end
end