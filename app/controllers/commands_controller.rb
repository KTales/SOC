class CommandsController < ApplicationController
  def index
    begin
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

  def render_tournaments_to_user(response_url)
    attachments = []
    joinable = { fallback: 'Joinable Tournaments:',
                 color: '#36a64f',
                 fields: [] }

    Tournament.all.joinable.each do |tourn|
      field_info = {}
      field_info[:title] = "#{tourn.name} - Join: \'/tournament-join #{tourn.id}\'"
      field_info[:value] = "Created by: #{tourn.owner}"
      joinable[:fields] << field_info
    end

    attachments << joinable if joinable[:fields].present?

    current = {}
    current[:fallback] = 'In Progress:'
    current[:color] = '#ffff00'
    current[:fields] = []

    Tournament.all.started.each do |tourn|
      field_info = {}
      field_info[:title] = "#{tourn.id} - #{tourn.name}"
      field_info[:value] = "Created by: #{tourn.owner}"
      current[:fields] << field_info
    end

    attachments << current if current[:fields].present?

    if attachments.present?
      return {
        url: response_url,
        method: 'POST',
        attachments: attachments
      }.to_json
    else
      render_to_user(ErrorsHelper.generic_error(e), true)
    end
  end
end
