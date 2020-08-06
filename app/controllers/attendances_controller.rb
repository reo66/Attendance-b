class AttendancesController < ApplicationController
  
  def edit_one_month
    @user = User.find(params[:id])
    @attendances = @user.attendances.where(worked_on: @first_day..@last_day).order(:worked_on)
  end
end
