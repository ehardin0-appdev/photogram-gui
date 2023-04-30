class UsersController < ApplicationController
  def add
    input_username = params.fetch("query_username")

    a_new_user = User.new
    a_new_user.username = input_username
    a_new_user.save

    @the_user = input_username.at(0)

    #render({ :template => "user_templates/add.html.erb" })

    redirect_to("/photos/" + a_new_user.username)

  end
  
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })
    render({ :template => "user_templates/index.html.erb" })
  end

  def show
    # Parameters: {"path_username" => "anisa"}
    
    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.at(0)

    #if the_user == nil
     # redirect_to("/404")
   # else
      render({ :template => "user_templates/show.html.erb" })
    #end
  end

end
