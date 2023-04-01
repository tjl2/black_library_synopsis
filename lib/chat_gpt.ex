defmodule ChatGpt do
  use HTTPoison.Base

  @openai_endpoint "https://api.openai.com/v1/"
  @headers [
    {"Authorization", "Bearer #{System.get_env("OPENAI_API_KEY")}"},
    {"Content-Type", "application/json"}
  ]

  def process_request_url(url) do
    @openai_endpoint <> url
  end

  # @doc """
  # Send a request to the OpenAI API.
  #  API.
  # """

  #   curl https://api.openai.com/v1/completions \
  #   -H "Content-Type: application/json" \
  #   -H "Authorization: Bearer $OPENAI_API_KEY" \
  #   -d '{
  #   "model": "text-davinci-003",
  #   "prompt": "Brainstorm some ideas combining VR and fitness:",
  #   "temperature": 0.6,
  #   "max_tokens": 150,
  #   "top_p": 1,
  #   "frequency_penalty": 1,
  #   "presence_penalty": 1
  # }'

  def headers, do: @headers
end
