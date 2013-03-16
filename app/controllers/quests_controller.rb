class QuestsController < ApplicationController
  before_filter :only_admin, :except=>[:show]

  # GET /quests
  def index
    @quests = Quest.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /quests/1
  def show
    @quest = Quest.find(params[:id])
    if @quest.status == 'pre' and !@admin
      redirect_to :root
      return
    end

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /quests/new
  def new
    @quest = Quest.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /quests/1/edit
  def edit
    @quest = Quest.find(params[:id])
  end

  # POST /quests
  def create
    @quest = Quest.new(params[:quest])

    respond_to do |format|
      if @quest.save
        format.html { redirect_to @quest, notice: 'Quest was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /quests/1
  def update
    @quest = Quest.find(params[:id])

    respond_to do |format|
      if @quest.update_attributes(params[:quest])
        format.html { redirect_to @quest, notice: 'Quest was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /quests/1
  def destroy
    @quest = Quest.find(params[:id])
    @quest.destroy

    respond_to do |format|
      format.html { redirect_to quests_url }
    end
  end
end
