class CreateCommand < CommandsController

  def add(params)
    parts = params[:text].split(' ')

    if parts[1] == 'elim' || parts[1] == 'rr'
      new_tourn = Tournament.build(owner: params[:user_name],
                                   name: parts[0],
                                   style: parts[1])
      if new_tourn.save!
        render_to_user(':white_check_mark: Thanks! That tournament has been added to the system.')
      else
        render_to_user(ErrorsHelper.save_error)
      end
    else
      render_to_user(':no_good: That\'s not a valid tournament. Remember the style options are \'elim\' for Elimination or \'rr\' for Round Robin')
    end
  end
end
