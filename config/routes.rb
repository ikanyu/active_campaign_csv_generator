Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/active_campaign/campaign_report_open_list', to: 'active_campaign#campaign_report_open_list'
  post '/active_campaign/retrieve_campaign_report_open_list', to: 'active_campaign#retrieve_campaign_report_open_list'
end
