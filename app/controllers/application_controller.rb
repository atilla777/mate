class ApplicationController < ActionController::Base
  include PUI::Mixins::Controller

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  layout false

  def menu_items = Service::MenuItems.new(active_keys: menu_active_keys)
end
