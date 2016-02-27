class RewardsController < Admin::BaseController
  def index
    @rewards = Reward.all
  end

  def new
  end

  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      redirect_to rewards_path
    else
      render :new
    end
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :cost)
  end
end