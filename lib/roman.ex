defmodule RomanNumerals do
  @roman_mappings [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  def to_roman(number) when is_integer(number) and number > 0 do
    do_to_roman(number, "")
  end

  defp do_to_roman(0, acc), do: acc

  defp do_to_roman(number, acc) do
    {arabic, roman} = Enum.find(@roman_mappings, fn {arabic, _} -> number >= arabic end)
    do_to_roman(number - arabic, acc <> roman)
  end
end
