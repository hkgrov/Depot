class ApplicationController < ActionController::Base
    def application
        @time = Time.now
    end
end
