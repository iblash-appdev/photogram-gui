class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc})

    render({ :template => "user_templates/index.html.erb" })
  end

  def show
    # Parameters: {"path_username" => "anisa"}
    url_username = params.fetch("username")

    matching_usernames = User.where({ :username => url_username})

    @the_user = matching_usernames.first

    render({ :template => "user_templates/show.html.erb" })
  end

  def create
    input_name = params.fetch("query_username")

    a_new_user = User.new
    a_new_user.username = input_name

    a_new_user.save

    # render({ :template => "user_templates/create.html.erb" })
    next_url = "/users/" + a_new_user.username.to_s 
    redirect_to(next_url)
  end

  def edit
    the_id = params.fetch("user_id")

    matching_user = User.where({ :id => the_id })

    @the_user = matching_user.at(0)

    input_user = params.fetch("query_username")

    @the_user.username = input_user

    @the_user.save

    # render({ :template => "user_templates/edit.html.erb" })

    redirect_to("/users/#{@the_user.username}")
  end
end
