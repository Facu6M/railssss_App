class ProductsController < ApplicationController

    def index
      @products = Product.all
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to @product, notice: 'Se ha creado el producto correctamente.'
      else
        flash[:notice] = 'Ha ocurrido un error al crear el producto.'
        render :new, status: :unprocessable_entity
      end
    end

    def show
      @product = Product.find(params[:id])
    end

    def edit
      @product = Product.find(params[:id])
    end

    def update
      @product = Product.find(params[:id])
      if @product.update(product_params)
        redirect_to @product, notice: 'Se actualizó el producto correctamente'
      else
        render :edit
      end
    end

    def destroy
      @product = Product.find(params[:id])
      @product.delete

      respond_to do |format|
        format.html { redirect_to products_url, notice: "El producto se elimino correctamente." }
        format.json { head :no_content}
      end
    end

    private
    def product_params
      params.require(:product).permit(:name, :description, :reference, :capacitaciones, :cargo)
    end

  end