class AnnouncementsController < ApplicationController

  def new
    if current_user.admin?
      @announcement = Announcement.new
    else
      redirect_to :root, :notice=>"Unauthorized access to page"
    end
  end

  def edit
    if current_user.admin?
      @announcement = Announcement.find(params[:id])
    else
      redirect_to :root, :notice=>"Unauthorized access to page"
    end
  	
  end

  def create
    if current_user.admin?
      announcement = Announcement.new(announcement_params)
      announcement.date_posted = DateTime.now
      announcement.save
      redirect_to :root
    else
      redirect_to :root, :notice=>"Unauthorized access to page"
    end
  end

  def update
    if current_user.admin?
      announcement = Announcement.find(params[:id])
      if announcement.update_attributes(announcement_params)
        redirect_to :root, :notice => "The announcement has successfully been updated."
      else
        redirect_to :back, :alert => 'There was an error updating your announcement.'
      end  
    else
      redirect_to :root, :notice=>"Unauthorized access to page"
    end 
  end

  def destroy
    if current_user.admin?
    Announcement.destroy(params[:id])
    redirect_to :root, :notice => 'The announcement has been deleted.'
    else
      redirect_to :root, :notice=>"Unauthorized access to page"
    end
  end

  private
    def announcement_params
      params.require(:announcement).permit(:subject, :content)
    end

end
