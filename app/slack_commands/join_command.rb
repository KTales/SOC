class JoinCommand < CommandsController

  def add(params)
    tournament_id = params[:text]
    if tournament = Tournament.find_by(id: tournament_id)
      if Player.find(name: params[:user_name], tournament_id: tournament.id) || Player.create(name: params[:user_name], tournament_id: tournament.id)
        render_to_user(':white_check_mark: Thanks! You have joined the tournament!')
      else
        render_to_user(ErrorsHelper.save_error)
      end
    else
      render_to_user(':no_good: That\'s not a valid tournament id. Enter "/tournament-list" to see a list of tournaments you can join')
    end
  end

end
