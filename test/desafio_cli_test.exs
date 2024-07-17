defmodule DesafioCliTest do
  use ExUnit.Case
  doctest DesafioCli

  def list_files(folder_path) do
    case File.ls(folder_path) do
      {:ok, files} ->
        Enum.filter(files, fn file -> String.ends_with?(file, ".in") end)

      {:error, _} ->
        []
    end
  end

  test "roman one" do
    assert RomanNumerals.to_roman(1) == "I"
  end

  test "roman seventy two" do
    assert RomanNumerals.to_roman(72) == "LXXII"
  end

  test "roman one hundred" do
    assert RomanNumerals.to_roman(100) == "C"
  end
end
