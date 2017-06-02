module ErrorsHelper
  def self.generic_error(e)
    ":scream: Oops! Looks like something went wrong. You should let an admin know!\n>>>Hint: #{e}"
  end

  def self.invalid_token
    ':no_entry_sign: Invalid command token. Please contact an admin.'
  end

  def self.invalid_command
    ':no_entry_sign: Invalid command. New commands must be added by an admin.'
  end

  def self.blank_params
    ':warning: You forgot to include some parameters! Refer to the slash command help text.'
  end

  def self.managers_only
    ":no_good: While we applaud your ambition, this feature is currently only for managers. To locate a manager, try `/#{SlackCommand.find_by(controller: 'location', action: 'find_manager').command} @username`"
  end

  def self.save_error
    ':scream: Uh oh! Looks like we were unable to save your submission (sometimes servers get sleepy too).'
  end

  def self.tournament_not_found
    ':thinking_face: Turns out that tournament doesn\'t exist...'
  end
end
