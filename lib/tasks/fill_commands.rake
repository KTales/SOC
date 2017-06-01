namespace :fill_commands do
  task add_commands: :environment do
    SlackCommand.delete_all

    SlackCommand.create(command: 'tournament-create', controller: "Create", action: 'add', allow_blank: false, managers_only: false)
    SlackCommand.create(command: 'tournament-list', controller: "List", action: 'show', allow_blank: true, managers_only: false)
    SlackCommand.create(command: 'tournament-join', controller: "Join", action: 'add', allow_blank: false, managers_only: false)
    SlackCommand.create(command: 'tournament-start', controller: "Start", action: 'init', allow_blank: false, managers_only: true)
    SlackCommand.create(command: 'tournament-standings', controller: 'Standings', action: 'show', allow_blank: false, managers_only: false)
    SlackCommand.create(command: 'tournament-schedule', controller: 'Schedule', action: 'show', allow_blank: false, managers_only: false)
    SlackCommand.create(command: 'tournament-my-games', controller: 'MyGames', action: 'show', allow_blank: true, managers_only: false)
    SlackCommand.create(command: 'tournament-submit', controller: 'Submit', action: 'add', allow_blank: false, managers_only: false)
  end
end
