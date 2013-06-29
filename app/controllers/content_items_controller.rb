class ContentItemsController < ApplicationController
  # GET /content_items
  # GET /content_items.json
  def index
    @content_items = ContentItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @content_items }
    end
  end

  # GET /content_items/1
  # GET /content_items/1.json
  def show
    @content_item = ContentItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @content_item }
    end
  end

  # GET /content_items/new
  # GET /content_items/new.json
  def new
    @content_item = ContentItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content_item }
    end
  end

  # GET /content_items/1/edit
  def edit
    @content_item = ContentItem.find(params[:id])
  end

  # POST /content_items
  # POST /content_items.json
  def create

      case params[:content_item][:type]
        when "ContentItemArticle"
          @content_item = ContentItemArticle.new(params[:content_item])
        when "ContentItemLink"
          @content_item = ContentItemLink.new(params[:content_item])
        when "ContentItemQuestion"
          @content_item = ContentItemQuestion.new(params[:content_item])
        else
          raise "Unknown content_item type!"
      end

    respond_to do |format|
      if @content_item.save
        format.html { redirect_to @content_item, notice: 'Content item was successfully created.' }
        format.json { render json: @content_item, status: :created, location: @content_item }
      else
        format.html { render action: "new" }
        format.json { render json: @content_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /content_items/1
  # PUT /content_items/1.json
  def update
    @content_item = ContentItem.find(params[:id])

    respond_to do |format|
      if @content_item.update_attributes(params[:content_item])
        format.html { redirect_to @content_item, notice: 'Content item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @content_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content_items/1
  # DELETE /content_items/1.json
  def destroy
    @content_item = ContentItem.find(params[:id])
    @content_item.destroy

    respond_to do |format|
      format.html { redirect_to content_items_url }
      format.json { head :no_content }
    end
  end
end
