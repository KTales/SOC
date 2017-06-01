class WebhooksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new_tournament
    byebug
    if request.headers['Content-Type'] == 'application/json'
      data = JSON.parse(request.body.read)
    else
      # application/x-www-form-urlencoded
      data = params.as_json
    end

    render nothing: true
  end
end
