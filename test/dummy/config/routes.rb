Rails.application.routes.draw do
  mount Citizen::Engine => "/citizen"

  get "reports" => "reports#show"
end
