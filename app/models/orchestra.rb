# == Schema Information
#
# Table name: orchestras
#
#  id                     :bigint           not null, primary key
#  about                  :string(255)
#  concert_infomation     :string(255)
#  conditions             :string(255)
#  contact                :string(255)
#  cost                   :string(255)
#  date                   :string(255)
#  instrument_requirement :string(255)
#  title                  :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_id                :bigint
#
# Indexes
#
#  index_orchestras_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Orchestra < ApplicationRecord
  belongs_to :user
  
end
