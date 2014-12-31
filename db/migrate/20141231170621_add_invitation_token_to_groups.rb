class AddInvitationTokenToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :invitation_token, :string
    add_index :groups, :invitation_token
  end
end
