class PagesController < ApplicationController

    def show

        if params[:page] == "home"
            @announcements = Announcement.all
        end
            
        render template: "pages/#{params[:page]}"

    end

    def valid_page?
        File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
    end

end  
