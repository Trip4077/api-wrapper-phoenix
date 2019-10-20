# Github

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

  * Click the start here button to navigate to user view
  * Click See Favorites button to navigate to starred repo view
  * Click Visit Repo to navigate to the github url

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Back End API Wrapper*

### Getting User Information

The endpoint for retrieving user information is 

`localhost4000/api/data/#{username}`

Where the username matches the username associated with the github account you wish to pull user data from

### Getting Starred Repo Information

The endpoint for retrieving user information is 

`localhost4000/api/starred/#{username}`

Where the username matches the username associated with the github account you wish to pull repo data from



\* In absence of search form, endpoints can be manually changed to get any username that matches a github account against the github API