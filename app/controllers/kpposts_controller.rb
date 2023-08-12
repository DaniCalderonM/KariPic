class KppostsController < ApplicationController
  before_action :set_kppost, only: %i[ show edit update destroy ]
  before_action :authenticate_kpuser!, except: %i[ index ]
  before_action only: [ :create, :new, :destroy, :edit, :update ] do
    authorize_request(["author"])
  end
  # GET /kpposts or /kpposts.json
  def index
    @kpposts = Kppost.all
  end

  # GET /kpposts/1 or /kpposts/1.json
  def show
    @kpcomment = Kpcomment.new
    @kpcomment = @kppost.kpcomments
  end

  # GET /kpposts/new
  def new
    @kppost = Kppost.new
  end

  # GET /kpposts/1/edit
  def edit
  end

  # POST /kpposts or /kpposts.json
  def create
    @kppost = Kppost.new(kppost_params)
    @kppost.kpuser = current_kpuser

    respond_to do |format|
      if @kppost.save
        format.html { redirect_to kppost_url(@kppost), notice: "Kppost was successfully created." }
        format.json { render :show, status: :created, location: @kppost }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kppost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kpposts/1 or /kpposts/1.json
  def update
    respond_to do |format|
      if @kppost.update(kppost_params)
        format.html { redirect_to kppost_url(@kppost), notice: "Kppost was successfully updated." }
        format.json { render :show, status: :ok, location: @kppost }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kppost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kpposts/1 or /kpposts/1.json
  def destroy
    @kppost.destroy

    respond_to do |format|
      format.html { redirect_to kpposts_url, notice: "Kppost was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kppost
      @kppost = Kppost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kppost_params
      params.require(:kppost).permit(:description, :kpuser_id, kpimages: [])
    end
end
