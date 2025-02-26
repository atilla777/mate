# frozen_string_literal: true

module PortScan
  class HostsController < ApplicationController
    def index = render UI::El::Index
  end
end
