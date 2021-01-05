class TeamsController < ApplicationController

    def decode 
        JWT.decode(cookies[:jwt])
    end

    def create
        byebug
        token = decode
    end
end
