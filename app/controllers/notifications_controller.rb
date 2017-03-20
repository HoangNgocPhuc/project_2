class NotificationsController < ApplicationController
	before_action :authenticate_user!
	# def create
	# 	# @noti = Notification.all.order(id: :desc)
	# 	@noti = current_user.notifications.order(id: :desc)
	# 	respond_to do |format|
 #        	format.html { redirect_to :back }
 #        	format.js
 #    	end
	# end
	# def index
	# 	@noti = current_user.notifications.order(id: :desc)
 #  		respond_to do |format|
 #  			format.html
 #  		end
	# end

end