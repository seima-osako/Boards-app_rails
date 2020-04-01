# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
  has_many :board_tag_relations
  # 中間テーブルを経由
  has_many :boards, through: :board_tag_relations
end
