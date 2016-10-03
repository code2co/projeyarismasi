class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :layout_by_resource
  rescue_from "AccessGranted::AccessDenied" do |exception|
    redirect_to root_path, alert: "Bu sayfaya erişmek için izniniz yok."
  end

  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end
