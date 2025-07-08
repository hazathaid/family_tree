parents = [ { name: "Fachrurodji", gender: "male" }, { name: "Enjot Khodijah", gender: "female" } ]
user_parents = parents.map do |parent|
  first_name = parent[:name].downcase.split(" ").first
  full_email = "#{first_name}@family-tree.com"
  user = User.new(email: full_email, full_name: parent[:name], gender: parent[:gender])
  user.password = "f4m1lyTr33"
  user.save
end

father, mother = user_parents
UserRelation.find_or_create_by!(user: father, relation: mother, relation_as: :spouse)
UserRelation.find_or_create_by!(user: mother, relation: father, relation_as: :spouse)
