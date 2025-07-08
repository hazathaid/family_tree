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
    inverse = case relation_as.to_sym
    when :father then :child
    when :mother then :child
    when :child
                if relation.gender == "male"
                  :father
                elsif relation.gender == "female"
                  :mother
                end
    when :spouse then :spouse
    when :sibling then :sibling
    when :cousin then :cousin
    else
      nil
    end

    if inverse && !UserRelation.exists?(user: relation, relation: user)
      UserRelation.create(user: relation, relation: user, relation_as: inverse)
    end
  end
end
