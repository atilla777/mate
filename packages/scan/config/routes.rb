# frozen_string_literal: true

Scan::Engine.routes.draw do
  resources :configs
  resources :tasks, only: %i[index show create destroy]
  resources :results, only: %i[index show destroy]
end
