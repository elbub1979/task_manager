class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!, :authorize
  before_action :set_user, only: %i[show edit destroy]


  def authorize
    render(file: File.join(Rails.root, 'public/403.html'), status: 403, layout: false) if forbidden?
  end

  def forbidden?
    !current_user.is_a?(Admin)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
