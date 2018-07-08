class Client::SkillsController < ApplicationController
  def new
    @skill = {}
    render 'new.html.erb'
  end

  def create
    @skill = {
                  skill_name: params[:skill_name]
                  }
    response = Unirest.post("https://morning-oasis-72057.herokuapp.com/api/skills", parameters: @skill)


    if response.code == 200
         flash[:success] = "Successfully created Skill"
         redirect_to "/client/students/#{current_user_id}"
         
       elsif response.code == 401
         flash[:warning] = "You are not authorized to make a skill"
         redirect_to '/'
       elsif
         @errors = response.body['errors']
         render 'new.html.erb'
       end
  end
  def update
     @skill = {
                       skill_name: params[:skill_name]

                     }

     response = Unirest.patch("https://morning-oasis-72057.herokuapp.com/api/skills/#{params['id']}", parameters: @skill)


     if response.code == 200
       flash[:success] = "Successfully updated Skill"
       redirect_to "/client/students/#{current_user_id}"
     elsif response.code == 401
       flash[:warning] = "You are not authorized to update a skill"
       redirect_to '/'
     else
       @errors = response.body['errors']
       render 'edit.html.erb'
     end
   end

   def destroy
    response = Unirest.delete("https://morning-oasis-72057.herokuapp.com/api/skills/#{params['id']}")
     if response.code == 200
     flash[:success] = "Successfully destroyed skill"
      redirect_to "/client/students/#{current_user_id}"
     
     else
       flash[:warning] = "You are not authorized"
       redirect_to '/'
     end
   end
end
