class Client::ResumesController < ApplicationController
  def show
    resume_id = params[:id]
    # Add a unirest request here
    @resume = response.body
    render 'show.html.erb'
  end

  def edit
    # Add a Unirest request here
    @resume = response.body
    render 'edit.html.erb'
  end

  def update
    @student = {
                  'student_id' => params[:id],
                  'first_name' => params[:first_name],
                  'last_name' => params[:last_name],
                  'email' => params[:email],
                  'phone_number' => params[:phone_number],
                  'bio' => params[:bio],
                  'linkedin_URL' => params[:linkedin_URL],
                  'personal_blog_URL' => params[:personal_blog_URL],
                  'github_URL' => params[:github_URL],
                  'photo_URL' => params[:photo_URL]

                }
    # Add a patch Unirest request
    flash[:success] = "Successfully updated student information"
         redirect_to "/client/products/#{params[:id]}"
       elsif response.code == 401
         flash[:warning] = "You are not authorized to update a student information"
         redirect_to '/'
       else
         @errors = response.body['errors']
         render 'edit.html.erb'
       end
  end
end
