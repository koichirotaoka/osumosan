class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]
  before_action :login_check_current_vendor, only: [:edit, :destroy]
  
  def index
    @q        = House.search(params[:q])
    @houses = @q.result(distinct: true).order(created_at: :desc)
  end  
  
  def new
    @houses = House.all
    if params[:back]
      @house = House.new(house_params)
    else
      @house = House.new
    end
  end
  
  def show
  end

  def create
    @house = House.new(house_params)
    @house.vendor_id = current_vendor.id 
    if @house.save
      redirect_to houses_path, notice: '投稿しました！'
    else
      render 'new'
    end
  end
  
  def confirm
    @house = House.new(house_params)
    @house.vendor_id = current_vendor.id
    render :new if @house.invalid?
  end
  
  
  def destroy
    @house.destroy
    redirect_to houses_path, notice:"投稿を削除しました！"
  end
  
  def edit
    @house = House.find(params[:id])
  end
  
  def update
    @house = House.find(params[:id])
    if @house.update(house_params)
      redirect_to houses_path, notice: "投稿を編集しました！"
    else
      render 'edit'
    end
  end
  
  private
  
  def house_params
    params.require(:house).permit(:title, :rent, :deposit, :gratuityfee, :location, :access, :area, :age, :layout, :lightning, :service, :hashtag, :image, :image_cache, :vendor_id)
  end
  
  def set_house
    @house = House.find_by_id(params[:id])
  end
  
  def login_check_user
    return redirect_to new_user_session_path unless user_signed_in?
  end
  
  def login_check_vendor
    return redirect_to new_vendor_session_path unless vendor_signed_in?
  end
  
  def login_check_current_vendor
    unless @house.vendor_id==current_vendor.id
      flash[:notice] = '失敗しました'
      return redirect_to new_vendor_session_path
    end
  end
  
end