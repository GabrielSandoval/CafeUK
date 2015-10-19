class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		if can_administer?
			@users = User.all.order(:id)
		else
			redirect_to :root, :notice=>"Unauthorized access to page"
		end
	end

	def show
		user = User.find(params[:id])
		if can_administer? || current_user.id == user.id
			@user = user
		else
			redirect_to :root, :notice=>"Unauthorized access to page"
		end
	end

	def destroy
		if can_administer? || current_user.id == user.id
			User.destroy(params[:id])
			redirect_to :root, :notice=>"The account of the user has been deleted."
		else
			redirect_to :root, :notice=>"Unauthorized access to page"
		end

	end

end
