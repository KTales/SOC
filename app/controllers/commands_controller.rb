class CommandsController < ApplicationController
  def index
    begin
      render json: 'working'
    #   cmd = params[:command].gsub('/', '')
    #   command = SlackCommand.find_by_command(cmd)
    #   render json: "#{command.controller.capitalize}Command".constantize.new.send(command.action, params)
    # # rescue CustomExceptions::UserNotFound
    # #   render_to_user(ErrorsHelper.user_not_found, true)
    # # rescue Exception => e
    # #   render_to_user(ErrorsHelper.generic_error(e), true)
    end
  end
end
