class SessionsController < ApplicationController

  def current_user_id
    @current_user_id ||= session["user_id"]
  end
  helper_method :current_user_id

  def new
    render 'new.html.erb'
  end

  def create
    client_params = {
                     auth: {
                            email: params[:email],
                            password: params[:password]
                           }
                     }     

    response = Unirest.post(
                            "https://morning-oasis-72057.herokuapp.com/user_token", 
                            parameters: client_params
                            )
    
    if response.code == 201
      session[:jwt] = response.body["jwt"]
      session[:user_id] = response.body["user"]["id"]
      flash[:success] = 'Successfully logged in!'
      redirect_to "/client/students/#{current_user_id}"
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/login'
    end
  end

  def destroy
    session[:jwt] = nil
    session[:user_id] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to '/login'
  end

end
