defmodule Inmana.Welcomer do
  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  defp evaluate("banana", 42) do
    {:ok, "Vc é Gamer."}
  end

  defp evaluate(name, age) when age > 18 do
    {:ok, "Boas vindas, #{name}"}
  end

  defp evaluate(name, _age) do
    {:error, "Boas vindas, #{name}, seu desimportante"}
  end
end
