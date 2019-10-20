defmodule Github do
  @expected_fields ~w(
    "name" "full_name" "owner" "html_url" "url" "description" 
  )

  def generate_id do
    Application.get_env(:app, :api_id)
  end

  def genereate_client do
    Application.get_env(:app, :api_client)
  end

  # Configures the url endpoint for the specific user handle passed
  def process_url(handle) do
    "https://api.github.com/users/#{handle}?client_id=#{Github.generate_id}&client_secret=#{Github.genereate_client}"
  end

  # Configures the url endpoint for a list of users
  def process_url do
    "https://api.github.com/users?client_id=#{Github.generate_id}&client_secret=#{Github.genereate_client}"
  end

  # Decodes HTTPoison Response body
  def decode_body(res) do
    IO.inspect res
    Poison.decode! res.body
  end

  # Process of retrieving user information from github: dynamic
  def fetch_user_info(handle) do
    Github.process_url(handle)
    |> HTTPoison.get!
    |> Github.decode_body
  end

  # Process of retrieving user information from github: static
  def fetch_user_info do
    Github.process_url
    |> HTTPoison.get!
    |> Github.decode_body
  end

  # Process of retrieving starred repo information from github: dynamic
  def fetch_starred_repos(handle) do
    api_id = Application.get_env(:app, :api_id)
    api_client = Application.get_env(:app, :api_client)
    response = HTTPoison.get! "https://api.github.com/users/#{handle}/starred?client_id=#{Github.generate_id}&client_secret=#{Github.genereate_client}"

    Poison.decode! response.body
  end  
  
  # Process of retrieving starred repo information from github: static
  def fetch_starred_repos do
    HTTPoison.get! "https://api.github.com/users/Trip4077/starred?client_id=#{Github.generate_id}&client_secret=#{Github.genereate_client}"
    |> Github.decode_body
  end
end
