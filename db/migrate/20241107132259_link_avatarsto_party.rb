class LinkAvatarstoParty < ActiveRecord::Migration[7.1]
  def change
    add_reference :avatars, :party, foreign_key: true
  end
end
