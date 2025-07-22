members = [ { name: "Dadang Amir Muslim", gender: "male" }, { name: "Dedeh", gender: "female" }, { name: "Anas Maulana", gender: "male" }, { name: "Anita", gender: "female" }, { name: "Yanyan Barnansyah", gender: "male" } ]
members.each do |member|
  first_name = member[:name].downcase.split(" ").first
  full_email = "#{first_name}@family-tree.com"
  user = User.find_or_initialize_by(email: full_email, full_name: member[:name], gender: member[:gender])
  user.password = "f4m1lyTr33"
  user.save
end
relationships = [
  # spouse
  { source: "Dadang Amir Muslim", target: "Dedeh", relation: :spouse },
  { source: "Anas Maulana", target: "Anita", relation: :spouse },

  # child
  { source: "Dadang Amir Muslim", target: "Anas Maulana", relation: :child, child_order: 1 },
  { source: "Dedeh", target: "Anas Maulana", relation: :child, child_order: 1 },
  { source: "Dadang Amir Muslim", target: "Yanyan Barnansyah", relation: :child, child_order: 2 },
  { source: "Dedeh", target: "Yanyan Barnansyah", relation: :child, child_order: 2 }
]

relationships.each do |rel|
  from_user = User.find_by(full_name: rel[:source])
  to_user = User.find_by(full_name: rel[:target])
  next unless from_user && to_user

  UserRelation.find_or_create_by!(
    user: from_user,
    relation: to_user,
    relation_as: rel[:relation],
    child_order: rel[:child_order]
  )
end
