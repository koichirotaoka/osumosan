class VendorsController < ApplicationController
  before_action :authenticate_vendor!, only: [:show, :edit, :update, :destroy]
  
  def index
    @vendors =Vendor.all
  end
  
  def new
    @vendor = Vendor.new
  end
  
  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      redirect_to vendor_path(@vendor.id)
    else
      render 'new'
    end
  end
  
  def show
    @vendor = Vendor.find(params[:id])
  end
  
  private
  
  def vendor_params
    params.require(:vendor).permit(:name, :email, :password,
                                 :password_confirmation,)
  end
end
