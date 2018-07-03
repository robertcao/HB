class ListedEmail < ActiveRecord::Base

  Forbidden_Access_Account = 9999

  Partners_For_Access = 1002

  def self.list(list_id)
    self.where(list_id: list_id).map(&:email)
  end

end