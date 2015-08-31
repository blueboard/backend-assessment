class Api::V1::DataController < Api::V1::BaseController
  before_filter :load_data
  before_filter :find_item, only: [:show, :update, :destroy]

  def index
    items_per_page = 5

    render json: @data
  end

  def destroy
    if @item.destroy
      write_to_json
      render json: @data
    else
      render json: {message: "something went wrong, wasn't able to delete item"}
    end
  end

  def update
    if @item
      @item.update_attributes(item_params)
      write_to_json
      render json: @data
    else
      render json: {message: "item not found."}
    end
  end

  def show
    if @item
      render json: @item
    else
      render json: {message: "item not found."}
    end
  end

  def create
    if params["user"] and params["experience"]
      @item = Perk.create({
        user_id: params["user"],
        experience: params["experience"],
        date: Date.today,
        status: "New"
      })
      write_to_json
      render json: @data
    else
      render json: {message: "user and experience is required"}
    end
  end

  private
  #load all data from database
  def load_data
    @data = Perk.all
  end

  #find item for delete, update, and show with before_filter
  def find_item
    @item = Perk.find(params["id"].to_i)
  end

  #strong parameters for security
  def item_params
    params.permit(:id, :user, :experience, :status)
  end

  def filter_params
    params.permit(:page, :filter, :query)
  end

  #write data to json every operation
  def write_to_json
    File.open(File.join(Rails.root, 'public', 'data.json'), 'w') do |file|
      file.write(@data.to_json)
    end
  end
end
