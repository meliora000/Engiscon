class ParticipantsController < ApplicationController
  before_action :set_post
  before_action :set_participant, only: [:destroy, :accept]

  def create
    @participant = @post.participants.new
    @participant.user = current_user
    @participant.save
  end

  def accept
    @participant.update!(is_accepted:true)
  end

  def destroy
    @participant.destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id]) if params[:post_id]
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_participant
    @participant = Participant.find(params[:id])
  end

  def participant_params
    params.require(:participant)
  end
end