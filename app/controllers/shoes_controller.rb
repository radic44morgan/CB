class ShoesController < ApplicationController
  def index
    filter = params.extract!(:start_key, :end_key).reject{|_, v| v.blank?}
    @shoes = Shoe.all(filter).to_a
    if @shoes.size > 30
      @last_key = @shoes.pop.try(:key)
    end
    respond_to do |format|
      format.html
      format.json do
        render :json => {:last_key => @last_key, :items => @shoes}
      end
    end
  end

  def show
    @shoes = Shoe.all(:start_key => [params[:id]],
                                               :end_key => ["#{params[:id]}\uefff"]).to_a
    @shoe = Shoe.find(params[:id])
  end

  def edit
    @shoe = Shoe.find(params[:id])
  end

  def update
    @shoe = Shoe.find(params[:id])
    @shoe.update(params[:shoe], params[:cas].to_i)
    redirect_to @shoe
  end
end
