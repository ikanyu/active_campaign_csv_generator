class ActiveCampaignController < ApplicationController
  def campaign_report_open_list
  end

  def retrieve_campaign_report_open_list
    respond_to do |format|
      format.html
      format.csv { send_data create_csv, filename: "ac-report-#{Date.today}.csv" }
    end
  end

  private

  def create_csv
    CSV.generate do |csv|
      csv << selected_fields

      campaign_ids.each do |campaign_id|
        response = http.get("https://moneysmart.api-us1.com/api/3/campaigns/#{campaign_id}")
        campaign_body = JSON.parse(response.body)["campaign"]
        csv << campaign_body.values_at(*selected_fields)
      end
    end
  end

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