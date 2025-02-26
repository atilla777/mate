# frozen_string_literal: true

I18n.load_path += Dir[File.join(__dir__, "locales", "*.{yml}")]

require_relative "helpers/icons"
require_relative "helpers/view"
require_relative "helpers/input"

Dir[File.join(__dir__, "**", "*.rb")].each do |file|
  require file
end
