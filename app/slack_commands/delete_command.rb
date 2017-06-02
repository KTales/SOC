class CreateCommand < CommandsController

  def delete(params)
    tournament_id = params[:text].split(' ')

    # Delete a tournament
    # Delete depedencies - matches and users

    if tournament = Tournament.find_by(id: tournament_id)
      players = Player.where(tournament_id: tournament_id)
      matches Matches.where(tournament_id: tournament_id).delete_all
      if tournament.destroy && players.destroy && matches.destroy
        render_to_user('Tournament deleted.')
      else
        render_to_user(ErrorsHelper.delete_error)
      end
    else
      render_to_user(':no_good: That\'s not a valid tournament id. Enter "/tournament-list" to see a list of tournaments you can delete')
    end

  end
end

###


if parts[1] == 'elim' || parts[1] == 'rr'
  if Tournament.create(status: 0, owner: params[:user_name],name: parts[0],style: parts[1])
    render_to_user(':white_check_mark: Thanks! That tournament has been added to the system.')
  else
    render_to_user(ErrorsHelper.save_error)
  end
else
  render_to_user(':no_good: That\'s not a valid tournament. Remember the style options are \'elim\' for Elimination or \'rr\' for Round Robin')
end
