class DeleteCommand < CommandsController

  def delete(params)
    (byebug)
    tournament_id = params[:text]
    tournament = Tournament.find_by(id: tournament_id)
    # Delete a tournament
    # Delete depedencies - matches and users
    # render_to_user(ErrorsHelper.managers_only) if tournament.owner != params[:user_name]
    if tournament
      if tournament.destroy
        render_to_user("Deleted tournament with Name: '#{tournament.name}' and ID: #{tournament.id}")
      else
        render_to_user(ErrorsHelper.delete_error)
      end
    else
      render_to_user(':no_good: That\'s not a valid tournament id. Enter "/tournament-list" to see a list of tournaments you can delete')
    end

  end
end
