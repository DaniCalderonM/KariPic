class KpcommentsController < ApplicationController
    before_action :set_kpcomment, only: %i[ show edit update destroy ]
    before_action :authenticate_kpuser!, except: %i[ index ]
    before_action only: [ :create, :new, :edit, :update, :destroy ] do
      authorize_request(["normal_kpuser", "author"])
      end

  # GET /comments/1 or /comments/1.json
    def show
    end
      
  # GET /comments/new
    def new
    @kpcomment = Kpcomment.new
    end
      
  # POST /comments or /comments.json
    def create
      @kpcomment = Kpcomment.new(kpcomment_params)
      @kpcomment.kpuser = current_kpuser
        respond_to do |format|
        if @kpcomment.save
          format.html { redirect_to kpcomments_url(@kpcomment), notice: "Tú comentario fue creado con éxito." }
        else
          format.html { redirect_to kpcomments_url(@kpcomment), notice: "No se pudo crear tú comentario" }
            end
        end
      end
      
  # PATCH/PUT /comments/1 or /comments/1.json
    def update
    respond_to do |format|
     if @kpcomment.update(kpcomment_params)
          format.html { redirect_to kpcomment_url(@kpcomment), notice: "Tú comentario se actualizo con éxito" }
          format.json { render :show, status: :ok, location: @kpcomment }
          else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @kpcomment.errors, status: :unprocessable_entity }
          end
     end
    end
      
  # DELETE /comments/1 or /comments/1.json
    def destroy
    @kpcomment.destroy
    respond_to do |format|
        format.html { redirect_to kpcomments_url(@kpcomment), notice: "Tú comentario fue eliminado con éxito" }
        format.json { head :no_content }
        end
    end
      
  private
   # Use callbacks to share common setup or constraints between actions.
    def set_kpcomment
       @kpcomment = Kpcomment.find(params[:id])
    end
      
    # Only allow a list of trusted parameters through.
      def kpcomment_params
        params.require(:kpcomment).permit(:content, :kpuser_id, :kppost_id)
      end
end