class UnitsController < ApplicationController
  add_breadcrumb "Units", :units_path

  def new
    @unit = Unit.new
    add_breadcrumb "New Unit", :new_unit_path
  end

  def create
    @unit =Unit.new(unit_param)
    if@unit.save
      redirect_to @unit
    else
      render 'new'
    end
  end

  def show
    @unit= Unit.find(params[:id])
  end

  def index
    @units =Unit.all
    @number_of_items_per_page=5
    @page = params[:page] || 1
    @units = Unit.paginate(:page => params[:page], :per_page => 5)
  end

  def edit
    @unit = Unit.find(params[:id])
    add_breadcrumb "Edit Unit", :edit_unit_path
  end

  def update
    @unit = Unit.find(params[:id])
    @unit.update(unit_param)
    redirect_to @unit
  end

  def destroy
    @unit = Unit.destroy(params[:id])
    redirect_to @unit
  end

  private
  def unit_param
    params.require(:unit).permit(:name, :print_name)
  end
end
