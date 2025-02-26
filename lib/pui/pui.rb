# frozen_string_literal: true

I18n.load_path += Dir[File.join(__dir__, "locales", "*.{yml}")]

require_relative "helpers/icons"
require_relative "helpers/view"

Dir[File.join(__dir__, "**", "*.rb")].each do |file|
  require file
end
