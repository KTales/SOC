class ListCommand < CommandsController

  def show(params)
    render_tournaments_to_user(params[:response_url])
  end
end
