class ActiveCampaignController < ApplicationController
  def campaign_report_open_list
  end

  def retrieve_campaign_report_open_list
    csv = [

    ]
    campaign_ids.each do |campaign_id|
      http.get("https://moneysmart.api-us1.com/api/3/campaigns/#{campaign_id}")
    end
  end

  private

  def selected_fields
    params[:active_campaign][:selected_fields].reject { |c| c.empty? }
  end

  def access_token
    params[:active_campaign][:access_token]
  end

  def campaign_ids
    params[:active_campaign][:campaign_ids].split(",")
  end

  def http
    HTTP.headers('Api-Token': access_token)
  end
end