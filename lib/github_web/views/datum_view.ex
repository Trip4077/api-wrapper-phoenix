defmodule GithubWeb.DatumView do
  use GithubWeb, :view
  alias GithubWeb.DatumView

  def render("index.json", %{data: data}) do
    %{data: render_many(data, DatumView, "datum.json")}
  end

  def render("show.json", %{datum: datum}) do
    %{data: render_one(datum, DatumView, "datum.json")}
  end

  def render("datum.json", %{datum: datum}) do
    %{id: datum.id,
      name: datum.name,
      username: datum.username,
      repo: datum.repo}
  end
end
