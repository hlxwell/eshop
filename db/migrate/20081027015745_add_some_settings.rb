class AddSomeSettings < ActiveRecord::Migration
  def self.up
      Setting.create(:key=>'contact_us',:value=>'this is contact us')
      Setting.create(:key=>'about_us',:value=>'this is about us')
  end

  def self.down
      Setting.find_by_key('contact_us').destroy
      Setting.find_by_key('about_us').destroy
  end
end
