# frozen_string_literal: true

module Service
  class MenuItems < PUI::Service::Menu::Root
    item key: :core, title: 'Core' do |i|
      i.item key: :unit
      i.item key: :user
    end

    item key: :scan, title: 'Scan'
  end
end
