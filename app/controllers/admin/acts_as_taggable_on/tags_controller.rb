class Admin::ActsAsTaggableOn::TagsController < Admin::ApplicationController
  before_action :find_tag, only: %i(edit update destroy)

  def index
    respond_to do |format|
      format.html do
        @q = ActsAsTaggableOn::Tag.search(params[:q])
        @tags = @q.result(distinct: true)
      end

      format.json do
        tags = ActsAsTaggableOn::Tag.where('name like ?', params[:query][:term]).pluck(:name)
        render json: tags
      end
    end
  end

  def edit; end

  def update
    if @tag.update(tag_params)
      redirect_to action: :index, notice: 'Tag successfully updated'
    else
      render :edit
    end
  end

  def destroy
    if @tag.destroy
      redirect_to action: :index, notice: 'Tag successfully destroyed'
    else
      redirect_to action: :index, notice: 'Something whent wrong'
    end
  end

  private

  def tag_params
    params.require(:acts_as_taggable_on_tag).permit!
  end

  def find_tag
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
  end
end
