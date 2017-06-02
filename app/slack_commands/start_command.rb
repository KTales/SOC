class StartCommand < CommandsController

  def init(params)
    tournament = Tournament.find_by(id: params[:text].to_i)

    if tournament
      render_to_user(ErrorsHelper.managers_only) if tournament.owner != params[:user_name]
      @competitors = Player.all.where(tournament: tournament.id).pluck(:id, :name,).to_a
      byebug
      matches = pool_matches

      byebug
      matches.each do |match|
        byebug
        # Match.create(tournament_id: tournament.id, player1: )
      end
    else
      render_to_user(ErrorsHelper.tournament_not_found)
    end
  end

  def pool_matches(random = false)
    if @competitors.length.odd?
      @competitors.unshift([nil, 'bye'])
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
