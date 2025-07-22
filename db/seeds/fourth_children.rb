members = [ { name: "Amir Sidik", gender: "male" }, { name: "Tini Kusmiati", gender: "female" }, { name: "Ratih Surtikanti", gender: "female" }, { name: "Cecep Suhendi", gender: "male" }, { name: "Rizkarima", gender: "female" }, { name: "Iwan Kurniawan", gender: "male" }, { name: "Gundar Kolyubi", gender: "male" },
  { name: "Putri Nurlaela Hasan", gender: "female" }, { name: "Adhara Musyaffa Bilal", gender: "male" }, { name: "Aldebaran Ujabi Bariq", gender: "male" }, { name: "Shaula Naazneen Bahia", gender: "female" }, { name: "Iesha Prameswari Lathofa", gender: "female" }, { name: "Iklima Pramesti Almahyra", gender: "female" }, { name: "Ikram Pramudya Al-Fatih", gender: "male" },
  { name: "Fazura Arzeti Kolyubi", gender: "female" }, { name: "Khalid Khairy Kolyubi", gender: "male" }, { name: "Fazira Ayra Kolyubi", gender: "female" } ]
members.each do |member|
  first_name = member[:name].downcase.split(" ").first
  full_email = "#{first_name}@family-tree.com"
  user = User.find_or_initialize_by(email: full_email, full_name: member[:name], gender: member[:gender])
  user.password = "f4m1lyTr33"
  user.save
end
relationships = [
  # spouse
  { source: "Amir Sidik", target: "Tini Kusmiati", relation: :spouse },
  { source: "Ratih Surtikanti", target: "Cecep Suhendi", relation: :spouse },
  { source: "Rizkarima", target: "Iwan Kurniawan", relation: :spouse },
  { source: "Gundar Kolyubi", target: "Putri Nurlaela Hasan", relation: :spouse },

  # child
  { source: "Amir Sidik", target: "Ratih Surtikanti", relation: :child, child_order: 1 },
  { source: "Tini Kusmiati", target: "Ratih Surtikanti", relation: :child, child_order: 1 },
  { source: "Amir Sidik", target: "Rizkarima", relation: :child, child_order: 2 },
  { source: "Tini Kusmiati", target: "Rizkarima", relation: :child, child_order: 2 },
  { source: "Amir Sidik", target: "Gundar Kolyubi", relation: :child, child_order: 3 },
  { source: "Tini Kusmiati", target: "Gundar Kolyubi", relation: :child, child_order: 3 },
  { source: "Ratih Surtikanti", target: "Adhara Musyaffa Bilal", relation: :child, child_order: 1 },
  { source: "Cecep Suhendi", target: "Adhara Musyaffa Bilal", relation: :child, child_order: 1 },
  { source: "Ratih Surtikanti", target: "Aldebaran Ujabi Bariq", relation: :child, child_order: 2 },
  { source: "Cecep Suhendi", target: "Aldebaran Ujabi Bariq", relation: :child, child_order: 2 },
  { source: "Ratih Surtikanti", target: "Shaula Naazneen Bahia", relation: :child, child_order: 3 },
  { source: "Cecep Suhendi", target: "Shaula Naazneen Bahia", relation: :child, child_order: 3 },
  { source: "Rizkarima", target: "Iesha Prameswari Lathofa", relation: :child, child_order: 1 },
  { source: "Iwan Kurniawan", target: "Iesha Prameswari Lathofa", relation: :child, child_order: 1 },
  { source: "Rizkarima", target: "Iklima Pramesti Almahyra", relation: :child, child_order: 2 },
  { source: "Iwan Kurniawan", target: "Iklima Pramesti Almahyra", relation: :child, child_order: 2 },
  { source: "Rizkarima", target: "Ikram Pramudya Al-Fatih", relation: :child, child_order: 3 },
  { source: "Iwan Kurniawan", target: "Ikram Pramudya Al-Fatih", relation: :child, child_order: 3 },
  { source: "Gundar Kolyubi", target: "Fazura Arzeti Kolyubi", relation: :child, child_order: 1 },
  { source: "Putri Nurlaela Hasan", target: "Fazura Arzeti Kolyubi", relation: :child, child_order: 1 },
  { source: "Gundar Kolyubi", target: "Khalid Khairy Kolyubi", relation: :child, child_order: 2 },
  { source: "Putri Nurlaela Hasan", target: "Khalid Khairy Kolyubi", relation: :child, child_order: 2 },
  { source: "Gundar Kolyubi", target: "Fazira Ayra Kolyubi", relation: :child, child_order: 3 },
  { source: "Putri Nurlaela Hasan", target: "Fazira Ayra Kolyubi", relation: :child, child_order: 3 }
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
