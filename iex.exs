Application.put_env(:elixir, :ansi_enabled, true)
IEx.configure(
  colors: [enabled: true],
  default_prompt: [
    "\e[G",    # ANSI CHA, move cursor to column 1
    :magenta,
    "%prefix", # IEx prompt variable
    ">",       # plain string
    :reset
  ] |> IO.ANSI.format |> IO.chardata_to_string
)

defmodule IExHelpers do
  def reload! do
    Mix.Task.reenable "compile.elixir"
    Mix.Task.run "compile.elixir"
  end
end

iex = IExHelpers


