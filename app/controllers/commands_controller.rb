class CommandsController < ApplicationController
  def index
    begin
      render json: 'working'
      cmd = params[:command].gsub('/', '')
      command = SlackCommand.find_by_command(cmd)
      render json: "#{command.controller.capitalize}Command".constantize.new.send(command.action, params)
    rescue Exception => e
      render_to_user(ErrorsHelper.generic_error(e), true)
    end
  end

  def render_to_user(text, do_render = false)
    if do_render
      render json: {
        response_type: 'ephemeral',
        text: text
      }.to_json
    else
      return {
        response_type: 'ephemeral',
        text: text
      }.to_json
    end
  end
end
