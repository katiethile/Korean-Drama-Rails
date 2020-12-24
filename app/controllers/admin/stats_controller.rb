class Admin::StatsController < ApplicationController
    RailsAdmin.config do |config|
        config.current_user_method do
          current_admin
        end
      end      
end 