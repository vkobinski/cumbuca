defmodule DesafioCliTest do
  use ExUnit.Case
  doctest DesafioCli

  test "roman one" do
    assert RomanNumerals.to_roman(1) == "I"
  end

  test "roman seventy two" do
    assert RomanNumerals.to_roman(72) == "LXXII"
  end

  test "roman one hundred" do
    assert RomanNumerals.to_roman(100) == "C"
  end

  test "one name" do
    assert(DesafioCli.output(["ana"]) == ["ana I"])
  end

  test "1000 equal names" do
    input_names = Enum.map(1..1000, fn _ -> "ana" end)
    output_names = Enum.map(1..1000, fn x -> "ana #{RomanNumerals.to_roman(x)}" end)
    assert(DesafioCli.output(input_names) == output_names)
  end

  test "10000 equal names" do
    input_names = Enum.map(1..10000, fn _ -> "ana" end)
    output_names = Enum.map(1..10000, fn x -> "ana #{RomanNumerals.to_roman(x)}" end)
    assert(DesafioCli.output(input_names) == output_names)
  end

  test "no names" do
    input_names = []
    output_names = []
    assert input_names == output_names
  end

  test "two names" do
    input_names = ["joao", "victor", "victor", "joao"]
    output_names = ["joao I", "victor I", "victor II", "joao II"]
    assert(DesafioCli.output(input_names) == output_names)
  end

  def list_files(folder_path) do
    case File.ls(folder_path) do
      {:ok, files} ->
        Enum.filter(files, fn file -> String.ends_with?(file, ".in") end)

      {:error, _} ->
        []
    end
  end

  test "examples" do
    in_files = list_files("examples")

    Enum.each(in_files, fn in_file ->
      in_file_path = "examples/#{in_file}"
      out_file_path = String.replace(in_file_path, ".in", ".out")
      input = File.read!(in_file_path)
      expected_output = File.read!(out_file_path)
      actual_output = DesafioCli.output(String.split(input, "\n"))
      assert actual_output == String.split(expected_output, "\n")
    end)
  end
end
