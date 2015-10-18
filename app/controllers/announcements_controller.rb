class AnnouncementsController < ApplicationController

  def new
    @announcement = Announcement.new
  end

  def edit
  	@announcement = Announcement.find(params[:id])
  end

  def create
  	announcement = Announcement.new(announcement_params)
    announcement.date_posted = DateTime.now
    announcement.save
  	redirect_to :root
  end

  def update
    announcement = Announcement.find(params[:id])
    if announcement.update_attributes(announcement_params)
      redirect_to :root, :notice => "The announcement has successfully been updated."
    else
      redirect_to :back, :alert => 'There was an error updating your announcement.'
    end   
  end

  def destroy
    Announcement.destroy(params[:id])
    redirect_to :root, :notice => 'The announcement has been deleted.'
  end

  private
    def announcement_params
      params.require(:announcement).permit(:subject, :content)
    end

end
