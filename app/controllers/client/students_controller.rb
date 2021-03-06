class Client::StudentsController < ApplicationController
  def show
    student_id = params[:id]

    response = Unirest.get("https://morning-oasis-72057.herokuapp.com/api/students/#{student_id}")

    @student = response.body
    render 'show.html.erb'
  end

  def edit
    response = Unirest.get("https://morning-oasis-72057.herokuapp.com/api/students/#{params['id']}")

    @student = response.body
    render 'edit.html.erb'
  end

  def update
    @student = {
                first_name: params[:first_name],
                last_name: params[:last_name],
                email: params[:email],
                phone_number: params[:phone_number],
                bio: params[:bio],
                linked_in_url: params[:linked_in_url],
                personal_blog_url: params[:personal_blog_url],
                github_url: params[:github_url],
                photo_url: params[:photo_url],
                capstone_name: params[:capstone_name],
                capstone_description: params[:capstone_description],
                capstone_url: params[:capstone_url]
               }

       response = Unirest.patch("https://morning-oasis-72057.herokuapp.com/api/students/#{params['id']}", parameters: @student)


      if response.code == 200
        flash[:success] = "Successfully updated Student"
        redirect_to "/client/students/#{params[:id]}"
      elsif response.code == 401
        flash[:warning] = "You are not authorized to update a student"
        redirect_to '/'
      else
        @errors = response.body['errors']
        render 'edit.html.erb'
      end
  end
end
