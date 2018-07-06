class Client::ExperiencesController < ApplicationController
  def create
    @experience = {
                    start_date: "",
                    end_date: "",
                    job_title: "",
                    company_name: "",
                    details: ""
                  }
    # Add a unirest post request 

    if response.code == 200
         flash[:success] = "Successfully created Product"
         redirect_to "/client/products/"
       elsif response.code == 401
         flash[:warning] = "You are not authorized to make a product"
         redirect_to '/'
       elsif
         @errors = response.body['errors']
         render 'new.html.erb'
       end
  end
  def update
     @experience = {
                       start_date: params[:start_date],
                       end_date: params[:end_date],
                       job_title: params[:job_title],
                       company_name: params[:company_name],
                       details: params[:details]
                     }

     response = Unirest.patch(
                             "http://localhost:3000/api/products/#{params[:id]}",
                             parameters: @experience
                             )

     if response.code == 200
       flash[:success] = "Successfully updated Experience"
       redirect_to "/client/experiences/#{params[:id]}"
     elsif response.code == 401
       flash[:warning] = "You are not authorized to update a experience"
       redirect_to '/'
     else
       @errors = response.body['errors']
       render 'edit.html.erb'
     end
   end

   def destroy
     response = Unirest.delete("http://localhost:3000/api/experiences/#{params['id']}")
     if response.code == 200
     flash[:success] = "Successfully destroyed experience"
     redirect_to "/client/experiences"
     else
       flash[:warning] = "You are not authorized"
       redirect_to '/'
     end
   end
end