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
    %{
      avatar_url: datum["avatar_url"],
      bio: datum["bio"],
      email: datum["email"],
      company: datum["company"],
      blog: datum["blog"],
      followers: datum["followers"],
      following: datum["following"],
      login: datum["login"],
      name: datum["name"],
      starred_url: datum["starred_url"]
     }
  end
end
