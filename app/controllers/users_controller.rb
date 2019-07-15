class UsersController < ApplicationController
    def new
    end

    # Create new user on sign up
    def create
        if user = User.authenticate_with_crendentials(params[:email], params[:password])
          @user.save
          session[:user_id] = @user.id
          redirect_to '/'
        else
          redirect_to '/signup'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end