class Client::EducationsController < ApplicationController
  def new
    @education = {}
    render 'new.html.erb'
  end

  def create
    @education = {
                  start_date: "",
                  end_date: "",
                  degree: "",
                  university_name: "",
                  details: ""
                  }
    response = Unirest.post("https://morning-oasis-72057.herokuapp.com/api/educations", parameters: @education)
 

    if response.code == 200
         flash[:success] = "Successfully created education"
         redirect_to "/client/educations/"
       elsif response.code == 401
         flash[:warning] = "You are not authorized to make a education"
         redirect_to '/'
       elsif
         @errors = response.body['errors']
         render 'new.html.erb'
       end
  end
  def update
     @education = {
                       start_date: params[:start_date],
                       end_date: params[:end_date],
                       degree: params[:degree],
                       university_name: params[:university_name],
                       details: params[:details]
                     }

      response = Unirest.patch("https://morning-oasis-72057.herokuapp.com/api/educations/#{params['id']}", parameters: @education)


     if response.code == 200
       flash[:success] = "Successfully updated Education"
       redirect_to "/client/educations/#{params[:id]}"
     elsif response.code == 401
       flash[:warning] = "You are not authorized to update a education"
       redirect_to '/'
     else
       @errors = response.body['errors']
       render 'edit.html.erb'
     end
   end

   def destroy
    response = Unirest.patch("https://morning-oasis-72057.herokuapp.com/api/educations/#{params['id']}")

     if response.code == 200
     flash[:success] = "Successfully destroyed education"
     redirect_to "/client/educations"
     else
       flash[:warning] = "You are not authorized"
       redirect_to '/'
     end
   end
end
