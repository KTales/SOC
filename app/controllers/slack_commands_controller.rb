class SlackCommandsController < Admin::BaseController
  def index
    @commands = SlackCommand.all
  end

  def new
    @command = SlackCommand.new
  end

  def create
    @command = SlackCommand.new(slack_command_params)
    if @command.save
      flash[:success] = 'Command was successfully added!'
      redirect_to admin_slack_commands_path
    else
      flash[:danger] = 'An error occurred while saving.'
      render :new
    end
  end

  def edit
    @command = SlackCommand.find(params[:id])
  end

  def update
    @command = SlackCommand.find(params[:id])

    if @command.update(slack_command_params)
      flash[:success] = 'Command was successfully updated!'
      redirect_to admin_slack_commands_path
    else
      flash[:danger] = 'An error occurred while saving.'
      render :edit
    end
  end

  def destroy
    @command = SlackCommand.find(params[:id])
    @command.destroy
    flash[:success] = 'Command successfully delete!'
    redirect_to admin_slack_commands_path
  end

  private

  def slack_command_params
    params.require(:slack_command).permit(:command, :token, :managers_only)
  end
end
