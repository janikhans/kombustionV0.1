class WelcomeController < ApplicationController
    
    def splash
        if logged_in?
            redirect_to home_path
        end
    end
    
    def help
    end
  
    def about
    end
  
    def contact
    end
    
end
