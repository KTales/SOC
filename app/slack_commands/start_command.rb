class StartCommand < CommandsController

  def init(params)
    tournament = Tournament.find_by(id: params[:text].to_i)

    if tournament
      render_to_user(ErrorsHelper.already_started) if tournament.status != 0
      render_to_user(ErrorsHelper.managers_only) if tournament.owner != params[:user_name]
      @competitors = Player.all.where(tournament: tournament.id).pluck(:name).to_a
      matches = pool_matches

      matches.each do |match|
        Match.create(tournament_id: params[:text].to_i,
                     player1: match.first,
                     player2: match.second,
                     complete: match.first == 'bye' || match.second == 'bye',
                     winner: match.first == 'bye' ? match.second : match.second == 'bye' ? match.first : nil )
      end
      tournament.status = 1
    else
      render_to_user(ErrorsHelper.tournament_not_found)
    end
  end

  def pool_matches(random = false)
    if @competitors.length.odd?
      @competitors.unshift('bye')
    end
    if random
      @competitors.shuffle!
    end

    pivot = @competitors.shift
    pivot_partner = @competitors.shift
    first_partner = pivot_partner
    bottom, top = @competitors.each_slice(@competitors.length / 2).to_a
    top.reverse!
    matches = [[pivot, pivot_partner]]
    matches += bottom.zip(top)
    top.unshift(pivot_partner)
    bottom.push(top.pop)
    pivot_partner = bottom.shift
    while pivot_partner != first_partner
      matches += [[pivot, pivot_partner]]
      matches += top.zip(bottom)
      top.unshift(pivot_partner)
      bottom.push(top.pop)
      pivot_partner = bottom.shift
    end
    matches
  end
end
