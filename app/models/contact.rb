class Contact < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
end