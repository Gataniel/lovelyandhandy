class Admin::AboutSectionsController < Admin::ApplicationController
  before_action :find_about_section

  def edit; end

  def update
    if @about.update(about_section_params)
      redirect_to admin_path, notice: 'AboutSection is updated'
    else
      render :edit
    end
  end

  private

  def about_section_params
    params.require(:about_section).permit!
  end

  def find_about_section
    @about = AboutSection.take
  end
end
