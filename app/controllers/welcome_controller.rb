class WelcomeController < ApplicationController
    
    def splash
        if logged_in?
            redirect_to home_path
        end
    end
    
end
