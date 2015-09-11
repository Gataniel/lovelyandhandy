class Admin::ReviewsController < Admin::ApplicationController
  before_action :find_review, except: :index

  def index
    @reviews = Review.all
  end

  def edit; end

  def update
    if @review.update(review_params)
      redirect_to action: :index, notice: 'Review successfully updated'
    else
      render :edit
    end
  end

  def destroy
    if @review.destroy
      redirect_to action: :index, notice: 'Review successfully destroyed'
    else
      redirect_to action: :index, notice: 'Something whent wrong'
    end
  end

  private

  def review_params
    params.require(:review).permit!
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
