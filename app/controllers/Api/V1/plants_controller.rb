module Api
  module V1
    class PlantsController < ApiController
      before_filter :restrict_access
      def index
        respond_with Plant.all
      end

      def show
        respond_with Plant.find(params[:id])
      end

      def create
        respond_with Plant.create(plant_params)
      end

      def update
        respond_with Plant.find(params[:id]).update(plant_params)
      end

      private
        def plant_params
          params.permit(:id,
                        :name,
                        :description,
                        :optimal_sun,
                        :optimal_soil,
                        :planting_considerations,
                        :when_to_plant,
                        :growing_from_seed,
                        :transplanting,
                        :spacing,
                        :watering,
                        :feeding,
                        :other_care,
                        :diseases,
                        :pests,
                        :harvesting,
                        :storage_use,
           )
        end

        def restrict_access
          api_key = ApiKey.find_by(api_key: params[:api_key])
          head :unauthorized unless api_key
        end
    end
  end
end
