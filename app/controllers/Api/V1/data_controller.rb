class Api::V1::DataController < Api::V1::BaseController
  before_filter :load_data
  before_filter :find_item, only: [:show, :update, :destroy]

  def index
    items_per_page = 5
    page = 1
    page = params[:page]
    file = params[:filter]
    query = params[:query]

    render json: @data
  end

  def destroy
    if @item.destroy
      render json: @data
    else
      render json: {message: "something went wrong, wasn't able to delete item"}
    end
  end

  def update

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
        data_id: @data.count + 1,
        user: params["user"],
        experience: params["experience"],
        data: Date.today,
        status: "New"
      })

      render json: @data
    else
      render json: {message: "user and experience is required"}
    end
  end

  private
  def load_data
    @data = Perk.all
  end

  def find_item
    @item = Perk.find(params["id"].to_i)
  end

  def write_to_json

  end
end
