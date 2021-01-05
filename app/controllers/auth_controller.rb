class AuthController < ApplicationController

    def issue_token(payload)
        JWT.encode(payload, Rails.application.secrets.secret_key_base, "HS256")
    end

    def create 
        user = User.create(username: params[:username], password: params[:password])

        if user 
            user_jwt = issue_token({id: user.id})
            cookies.signed[:jwt] = {value: user_jwt, httponly: true}
            byebug
            render json: { 
                status: 'created',
                logged_in: true,
                username: user.username
             }
        else
            render json: {status: 500, logged_in: false}
        end
    end

    def logout 
        cookies.delete :jwt 
        render json: {logged_in: false}
    end
end
