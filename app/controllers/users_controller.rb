class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb" }) 
  end

  def show
      # Parameters: {"path_username" =>"anisa"}

      url_username = params.fetch("path_username")

      matching_usernames = User.where({ :username => url_username })

      @the_user = matching_usernames.at(0)

     # if @the _user == nil
      #  redirect_to("/404")
     # else

     render({ :template => "user_templates/show.html.erb"})

     def baii
      # Parameters: {"toast_id"=>"785"}
  
      the_id = params.fetch("roast_id")
  
      matching_users = User.where({ :id => the_id })
  
      the_user = matching_users.at(0)
  
      the_user.destroy
  
      #render({ :template => "photo_templates/baii.html.erb"})
      
      redirect_to("/users")
    end
  
    def create
  
      input_user = params.fetch("query_user")
      #input_caption = params.fetch("query_caption")
      input_user_id = params.fetch("query_user_id")
  
      a_new_user = User.new
  
      a_new_user.username = input_username
        
      a_new_user.save
  
      #render({ :template => "photo_templates/create.html.erb" })
      
      redirect_to("/users/" + a_new_user.id.to_s)
    end
  
    def update
  
      the_id = params.fetch("modify_id")
  
      matching_users =User.where({ :id => the_id})
  
      the_user = matching_users.at(0)
  
      input_user = params.fetch("query_user")
      #input_caption = params.fetch("query_caption")
      #input_owner_id = params.fetch("query_owner_id")
  
      the_user.image = input_user
      #the_photo.caption = input_caption
  
      the_user.save
  
      #render({ :template => "photo_templates/create.html.erb"})
      
      #redirect_to("/photos/" + the_photo.id.to_s)
  
      next_url = "/users/" + the_userclass.id.to_s
  
      redirect_to(next_url)
    end

  end 

end
