class ConferenceController < ApplicationController
  before_action :authenticate_user!

  def index
    @conferences = Conference.all
  end

  def new
    @conference = Conference.new
  end

  def create
    @conference = Conference.new(conference_params)
    @conference.host = current_user

    if @conference.save
      redirect_to(@conference, notice: 'Conference was successfully created.')
    else
      render action: :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def conference_params
    p = params.require(:conference).permit(:name, :starts_at)
    p[:starts_at] = p[:starts_at].to_datetime
    p
  end

end
