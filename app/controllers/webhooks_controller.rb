class WebhooksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new_tournament
    byebug
    params_list = params[:text].split(' ')
    new_tourn = Tournament.create(owner: params[:user_name],
                                  name: params_list[0],
                                  style: params_list[1])

    render json: new_tourn.name
  end
end
