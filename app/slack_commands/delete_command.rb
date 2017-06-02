class DeleteCommand < CommandsController

  def delete(params)
    tournament_id = params[:text].split(' ').first

    # Delete a tournament
    # Delete depedencies - matches and users

    if tournament = Tournament.find_by(id: tournament_id)
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
