class AddIsAcceptedToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :is_accepted, :boolean, default: :false
  end
end
