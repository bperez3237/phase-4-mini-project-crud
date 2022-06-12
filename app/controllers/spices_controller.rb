class SpicesController < ApplicationController

    #  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    # GET
    def index 
        spices = Spice.all 
        render json: spices
    rescue ActiveRecord::RecordNotFound
        render_not_found_response
    end

    # POST 
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    rescue ActiveRecord::RecordNotFound
        render_not_found_response
    end

    # # GET/:id
    # # def show
    # #     spice = find_spice
    # #     render json: spice
    # # end

    # PATCH/:id

    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice
    rescue ActiveRecord::RecordNotFound
        render_not_found_response
    end


    # DELETE /:id
    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    rescue ActiveRecord::RecordNotFound
        render_not_found_response
    end



    private

    def find_spice
        Spice.find(params[:id])
    end

    def spice_params
        params.permit(:title,:image, :description, :notes, :rating)
    end
        
    # def render_not_found_response
    #     render json: { error: "Spice not found" }, status: :not_found
    # end
end
