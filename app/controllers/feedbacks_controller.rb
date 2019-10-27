class FeedbacksController < ApplicationController
  before_action :set_booking
  before_action :check_if_feedback_already_provided

  def new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      redirect_to root_url, notice: 'Feedback for the booking has been submitted successfully'
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:content, :booking_id)
  end

  def check_if_feedback_already_provided
    redirect_to root_url, notice: 'Feedback for the booking has already been submitted' if @booking.feedback.present?
  end

  def set_booking
    @booking = Booking.find_by(id: params[:id])
    redirect_to root_url, notice: 'Invalid Booking ID!' if @booking.nil?
  end
end
