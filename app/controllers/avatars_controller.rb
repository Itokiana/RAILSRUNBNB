class AvatarsController < ApplicationController
        before_action :authorized, only: [:auto_login]

  def create
    puts'ù'*300
    puts params[:featured_image]
    @users =User.find(current_user.id)
    @users.update(user_params)
        render json:{
            user: @users
        }
  end
  private

    def user_params
        params.permit(:featured_image)
    end
  
end
