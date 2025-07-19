class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: { male: "male", female: "female" }
  has_many :user_relations
  has_many :relations, through: :user_relations, source: :relation

  # Incoming relations (other user → this user)
  has_many :inverse_user_relations, class_name: "UserRelation", foreign_key: :relation_id
  has_many :related_by_users, through: :inverse_user_relations, source: :user

  # ========== Family Tree Helper Methods ==========

  def parents
    inverse_user_relations.where(relation_as: :child).map(&:user)
  end

  def children
    user_relations.where(relation_as: [ :father, :mother ]).map(&:relation)
  end

  def siblings
    user_relations.where(relation_as: :sibling).map(&:relation)
  end

  def spouse
    user_relations.find_by(relation_as: :spouse)&.relation
  end

  def top_ancestor
    current = self
    while (parent = current.parents.first)
      current = parent
    end
    current
  end
end
