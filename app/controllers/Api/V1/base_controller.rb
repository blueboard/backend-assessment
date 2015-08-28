class Api::V1::BaseController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/vnd.datatestapp.v1' }
  before_filter :load_json
  respond_to :json

  rescue_from Exception, with: :generic_exception
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  private
  def record_not_found(error)
    respond_to do |format|
      format.json { render :json => {:error => error.message}, :status => 404 }
    end
  end

  def generic_exception(error)
    respond_to do |format|
      format.json { render :json => {:error => error.message}, :status => 500 }
    end
  end

  # reading and parsing data into an array of has
  def load_json
    test_data = JSON.parse(File.read(File.join(Rails.root, 'public', 'data.json')), quirks_mode: true)
    Perk.destroy_all

    test_data.each do |item|
      Perk.create({
        id: item["id"].to_i,
        user_id: item["user_id"].to_i,
        experience: item["experience"],
        date: item["date"],
        status: item["status"]
      })
    end
  end
end
