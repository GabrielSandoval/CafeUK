class FeedbacksController < ApplicationController

	before_action :authenticate_user!

	def index
		if current_user.admin?
			@feedbacks = Feedback.all
		else
			@feedbacks = Feedback.joins(:user).where(user: current_user)
		end
	end

	def new
		@feedback = Feedback.new
	end

	def create
		feedback = Feedback.new(feedback_params)
		feedback.date = DateTime.now
		feedback.time = DateTime.now
		feedback.user = User.find(current_user)
		feedback.save
		redirect_to :root, :notice => 'Thank you so much for your feedback!'
	end

	def destroy
		Feedback.destroy(params[:id])
		redirect_to feedbacks_path, :notice => 'The feedback has been deleted.'
	end

	private

	def feedback_params
		params.require(:feedback).permit(:subject, :message, :date, :time)
	end

end
