class Client::SkillsController < ApplicationController
  def create
    @education = {
                  skill_name: ""
                  }
    # Add a unirest post request 

    if response.code == 200
         flash[:success] = "Successfully created Skill"
         redirect_to "/client/skills/"
       elsif response.code == 401
         flash[:warning] = "You are not authorized to make a skill"
         redirect_to '/'
       elsif
         @errors = response.body['errors']
         render 'new.html.erb'
       end
  end
  def update
     @education = {
                       skill_name: params[:skill_name]

                     }

     response = Unirest.patch(
                             "http://localhost:3000/api/skills/#{params[:id]}",
                             parameters: @skill
                             )

     if response.code == 200
       flash[:success] = "Successfully updated Skill"
       redirect_to "/client/skills/#{params[:id]}"
     elsif response.code == 401
       flash[:warning] = "You are not authorized to update a skill"
       redirect_to '/'
     else
       @errors = response.body['errors']
       render 'edit.html.erb'
     end
   end

   def destroy
     response = Unirest.delete("http://localhost:3000/api/skills/#{params['id']}")
     if response.code == 200
     flash[:success] = "Successfully destroyed skill"
     redirect_to "/client/skills"
     else
       flash[:warning] = "You are not authorized"
       redirect_to '/'
     end
   end
end
