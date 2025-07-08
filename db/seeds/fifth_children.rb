members = [ { name: "Dadang Amir Muslim", gender: "male" }, { name: "Dedeh", gender: "female" }, { name: "Anas Maulana", gender: "male" }, { name: "Anita", gender: "female" }, { name: "Yanyan Barnansyah", gender: "male" } ]
members.each do |member|
  first_name = member[:name].downcase.split(" ").first
  full_email = "#{first_name}@family-tree.com"
  user = User.find_or_initialize_by(email: full_email, full_name: member[:name], gender: member[:gender])
  user.password = "f4m1lyTr33"
  user.save
end
