class WorkstationsController < ApplicationController
    before_action :set_workstation, only: [:show, :edit, :update, :destroy]

    # GET /workstations
    # GET /workstations.json
    def index
      workstations = Workstation.order('created_at DESC');
      render json: {status: 'SUCCESS', message:'sucesso', data:workstations},status: :ok
    end
  
    # GET /workstations/1
    # GET /workstations/1.json
    def show
        workstation = Workstation.find(params[:id])
				render json: {status: 'SUCCESS', message:'Loaded ', data:workstation},status: :ok
    end
  
    # GET /workstations/new
    def new
      @workstation = Workstation.new
    end
  
    # GET /workstations/1/edit
    def edit
    end
  
    # POST /workstations
    # POST /workstations.json
    def create
      workstation = Workstation.new(workstation_params)

      if workstation.save
        render json: {status: 'SUCCESS', message:'Saved ', data:workstation},status: :ok
      else
        render json: {status: 'ERROR', message:' not saved', data:workstation.erros},status: :unprocessable_entity
      end
  
      
    end
  
    # PATCH/PUT /workstations/1
    # PATCH/PUT /workstations/1.json
    def update
        workstation = Workstation.find(params[:id])
        if workstation.update_attributes(workstation_params)
          render json: {status: 'SUCCESS', message:'Updated', data:workstation},status: :ok
        else
          render json: {status: 'ERROR', message:' not update', data:workstation.erros},status: :unprocessable_entity
        end
   
    end
  
    # DELETE /workstations/1
    # DELETE /workstations/1.json
    def destroy
      workstation = Workstation.find(params[:id])
			workstation.destroy
			render json: {status: 'SUCCESS', message:'Deleted ', data:workstation},status: :ok
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_workstation
        @workstation = Workstation.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def workstation_params
        params.require(:workstation).permit(:name, :description)
      end
end
