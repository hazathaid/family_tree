class UserRelation < ApplicationRecord
  belongs_to :user
  belongs_to :relation, class_name: "User"

  enum relation_as: {
      father: 0,
      mother: 1,
      spouse: 2,
      sibling: 3,
      cousin: 4,
      child: 5,
      grandparent: 6,
      grandchild: 7
    }

  after_create :create_inverse

  def create_inverse
  inverse_as = case relation_as.to_sym
  when :father, :mother then :child
  when :child
                  case relation.gender
                  when "male" then :father
                  when "female" then :mother
                  else nil
                  end
  when :spouse then :spouse
  when :sibling then :sibling
  when :cousin then :cousin
  when :grandparent then :grandchild
  when :grandchild then :grandparent
  else nil
  end

  return unless inverse_as

  unless UserRelation.exists?(user: relation, relation: user, relation_as: inverse_as)
    UserRelation.create(user: relation, relation: user, relation_as: inverse_as)
  end
end
end
