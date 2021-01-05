class TodolistsController < ApplicationController
  before_action :set_todolist, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /todolists
  # GET /todolists.json
  def index
    @todolists = Todolist.all
  end

  # GET /todolists/1
  # GET /todolists/1.json
  def show
  end

  # GET /todolists/new
  def new
    #@todolist = Todolist.new
    @todolist = current_user.todolists.build
  end

  # GET /todolists/1/edit
  def edit
  end

  # POST /todolists
  # POST /todolists.json
  def create
    #@todolist = Todolist.new(todolist_params)
    @todolist = current_user.todolists.build(todolist_params)
    respond_to do |format|
      if @todolist.save
        format.html { redirect_to @todolist, notice: 'Todolist was successfully created.' }
        format.json { render :show, status: :created, location: @todolist }
      else
        format.html { render :new }
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todolists/1
  # PATCH/PUT /todolists/1.json
  def update
    respond_to do |format|
      if @todolist.update(todolist_params)
        format.html { redirect_to @todolist, notice: 'Todolist was successfully updated.' }
        format.json { render :show, status: :ok, location: @todolist }
      else
        format.html { render :edit }
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todolists/1
  # DELETE /todolists/1.json
  def destroy
    @todolist.destroy
    respond_to do |format|
      format.html { redirect_to todolists_url, notice: 'Todolist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def correct_user
    @todolist = current_user.todolists.find_by(id: params[:id])
    redirect_to todolists_path, notice: "Not authorise to do this" if @todolist.nil?
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todolist
      @todolist = Todolist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todolist_params
      params.require(:todolist).permit(:Todo, :Time, :Date, :status, :important, :user_id)
    end
end
