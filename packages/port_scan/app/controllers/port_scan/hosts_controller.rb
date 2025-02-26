# frozen_string_literal: true

module PortScan
  class HostsController < ApplicationController
    def index = render(UI::Base::Index.new)
  end
end
