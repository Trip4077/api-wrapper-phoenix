defmodule GithubWeb.StarredView do
    use GithubWeb, :view
    alias Github.StarredView

    def render("index.json", %{data: data}) do
        %{data: render_many(data, StarredView, "starred.html")}
    end

    def render("show.json", %{data: data}) do 
        %{data: render_one(data, StarredView, "starred.html")}
    end

    def render("starred.html", data: data) do 
        %{
            data: data
        }
    end
end