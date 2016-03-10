
class Api::V1::SessionsController < Api::V1::ApiController
  def create
    puts "***" * 100
    puts params
    puts "***" * 100
    user_password = params[:session][:password]
    username = params[:session][:username]
    user = username.present? && User.find_by(username: username)

    if user.valid_password? user_password
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
      render json: user, status: 200#, location: [:api, user]
    else
      render json: { errors: "Invalid username or password" }, status: 422
    end
  end

  def destroy
    user = User.find_by(auth_token: params[:id])
    user.generate_authentication_token!
    user.save
    head 204
  end
end
