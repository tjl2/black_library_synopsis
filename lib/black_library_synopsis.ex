defmodule BlackLibrarySynopsis do
  @moduledoc """
  Documentation for `BlackLibrarySynopsis`.
  """

  @doc """
  Generate a Black Library synopsis about a given prompt by using the OpenAI API.
  """
  def about(prompt) do
    case ChatGpt.post("completions", json_body(prompt), ChatGpt.headers(), recv_timeout: 8000) do
      {:ok, response} ->
        {:ok, body} = Jason.decode(response.body)
        IO.puts(body |> Map.get("choices") |> List.first() |> Map.get("text"))

      {:error, error} ->
        IO.inspect(error)
    end
  end

  @doc """
  Lambda handler for AWS Lambda.
  """
  def lambda_handler(%{"prompt" => prompt}, _context \\ %{}) do
    about(prompt)
  end

  defp json_body(prompt) do
    {:ok, json_encoded_body} =
      Jason.encode(%{
        "model" => "text-davinci-003",
        "prompt" => "Write a synopsis for a Black Library novel about #{prompt}",
        "temperature" => 0.6,
        "max_tokens" => 250,
        "top_p" => 1,
        "frequency_penalty" => 1,
        "presence_penalty" => 1
      })

    json_encoded_body
  end
end
