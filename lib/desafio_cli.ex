defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  @doc """
  A função main recebe os argumentos passados na linha de
  comando como lista de strings e executa a CLI.
  """
  def main(_args) do
    IO.puts(
      "Insira os nomes das pessoas uma em cada linha, e insira uma linha vazia para finalizar."
    )

    input_loop([])
  end

  def input_loop(names) do
    name = IO.gets("")

    if name == "\n" do
      Enum.reduce(
        names,
        %{},
        fn name, acc ->
          acc = Map.update(acc, name, 1, &(&1 + 1))
          IO.puts(Enum.join([name, RomanNumerals.to_roman(Map.get(acc, name))], " "))
          acc
        end
      )
    else
      input_loop(names ++ [String.trim(name)])
    end
  end
end
