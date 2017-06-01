class WebhooksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new_tournament
    byebug
    if request.headers['Content-Type'] == 'application/json'
      params_list = params[:text].split(' ')
      new_tourn = Tournament.create(owner: params[:user_name],
                        name: params_list[0],
                        style: params_list[1])

    return {
      response_type: 'in_channel',
      text: "#{new_tourn.name} Created!"
    }.to_json

    else
      # application/x-www-form-urlencoded
      data = params.as_json
    end
  end
end
