class Admin::OverviewsController < Admin::ApplicationController
  def index
  end

  def tags
    tags = ActsAsTaggableOn::Tag.where('name like ?', params[:query][:term]).pluck(:name)
    respond_to do |format|
      format.json { render json: tags }
    end
  end
end
