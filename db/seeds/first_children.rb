members = [ { name: "Didin Muhyiddin", gender: "male"  }, { name: "Euis Djulaeha", gender: "female" }, { name: "Imas Nur Asiah", gender: "female" }, { name: "Yayan Supriatna", gender: "male" }, { name: "Rizal Yusup Ramdhan", gender: "male" }, { name: "Dian Sudiarni", gender: "female" }, { name: "Ahmad Farid", gender: "male" },
{ name: "Lina Rosdiana", gender: "female" }, { name: "Lutfi Muharram", gender: "male" }, { name: "Ety Lestari", gender: "female" }, { name: "Siti Zenab Nurlaila", gender: "female" }, { name: "Rosmana Kurniadi", gender: "male" }, { name: "Muhammad Firmansyah", gender: "male" }, { name: "Suci Trisiani Ajeng Purwandani", gender: "female" },
{ name: "Ami Kulsum", gender: "female" }, { name: "Asep Rijwan Suhendi", gender: "male" }, { name: "Siti Mardiyah Ulfah", gender: "female" }, { name: "Mochammad Rifa", gender: "male" }, { name: "Nura Shofa Marwiyyah", gender: "female" }, { name: "Roswandi", gender: "male" }, { name: "Kashimah Adawiyah", gender: "female" }, { name: "Adzharussyukri", gender: "male" },
{ name: "Roza Dira Haqi", gender: "female" }, { name: "Risman Rismansyah", gender: "male" }, { name: "Aliya Dira Kholqi", gender: "female" }, { name: "Ummu Hawa Assa'diyah", gender: "female" }, { name: "Mohamad Musa", gender: "male" }, { name: "Adam Ibrahim", gender: "male" }, { name: "Muna Ilfa Salsabila", gender: "female" }, { name: "Alif Rahmatullah", gender: "male" }, { name: "Diva Lizetiany", gender: "female" },
{ name: "Laila Rahmah", gender: "female" }, { name: "Laula Rizky", gender: "female" }, { name: "Arriba Gissani", gender: "female" }, { name: "Ibnu Fikri Pamungkas", gender: "male" }, { name: "Tsabita Putri", gender: "female" }, { name: "Abdan Syakuuro", gender: "male" }, { name: "Aqila Tamamah Sya'diyatuddaraini", gender: "female" }, { name: "Asla Aliza Afkariyah", gender: "female" },
{ name: "Aisya Syuba Mahdiyah", gender: "female" }, { name: "Abyan Athhar", gender: "male" }, { name: "Muhammad Ryuma Syahdira", gender: "male" }, { name: "Amira Shofia Mecca", gender: "female" }, { name: "Aidan Muhammad Mulki", gender: "male" }, { name: "Nuzha Atalla Muadz", gender: "male" }, { name: "Shireen Jenna Rumaisya", gender: "female" }, { name: "Aabida Karimah Al Mas'udah", gender: "female" } ]
members.each do |member|
  first_name = member[:name].downcase.split(" ").first
  full_email = "#{first_name}@family-tree.com"
  user = User.find_or_initialize_by(email: full_email, full_name: member[:name], gender: member[:gender])
  user.password = "f4m1lyTr33"
  user.save
end
relationships = [
  # spouse
  { source: "Didin Muhyiddin", target: "Euis Djulaeha", relation: :spouse },
  { source: "Imas Nur Asiah", target: "Yayan Supriatna", relation: :spouse },
  { source: "Rizal Yusup Ramdhan", target: "Dian Sudiarni", relation: :spouse },
  { source: "Ahmad Farid", target: "Lina Rosdiana", relation: :spouse },
  { source: "Lutfi Muharram", target: "Ety Lestari", relation: :spouse },
  { source: "Siti Zenab Nurlaila", target: "Rosmana Kurniadi", relation: :spouse },
  { source: "Muhammad Firmansyah", target: "Suci Trisiani Ajeng Purwandani", relation: :spouse },
  { source: "Ami Kulsum", target: "Asep Rijwan Suhendi", relation: :spouse },
  { source: "Siti Mardiyah Ulfah", target: "Mochammad Rifa", relation: :spouse },
  { source: "Nura Shofa Marwiyyah", target: "Roswandi", relation: :spouse },
  { source: "Roza Dira Haqi", target: "Risman Rismansyah", relation: :spouse },
  { source: "Ummu Hawa Assa'diyah", target: "Mohamad Musa", relation: :spouse },
  { source: "Adam Ibrahim", target: "Muna Ilfa Salsabila", relation: :spouse },
  { source: "Alif Rahmatullah", target: "Diva Lizetiany", relation: :spouse },
  { source: "Arriba Gissani", target: "Ibnu Fikri Pamungkas", relation: :spouse },

  # child
  { source: "Didin Muhyiddin", target: "Imas Nur Asiah", relation: :child, child_order: 1 },
  { source: "Euis Djulaeha", target: "Imas Nur Asiah", relation: :child, child_order: 1 },
  { source: "Didin Muhyiddin", target: "Rizal Yusup Ramdhan", relation: :child, child_order: 2 },
  { source: "Euis Djulaeha", target: "Rizal Yusup Ramdhan", relation: :child, child_order: 2 },
  { source: "Didin Muhyiddin", target: "Ahmad Farid", relation: :child, child_order: 3 },
  { source: "Euis Djulaeha", target: "Ahmad Farid", relation: :child, child_order: 3 },
  { source: "Didin Muhyiddin", target: "Lutfi Muharram", relation: :child, child_order: 4 },
  { source: "Euis Djulaeha", target: "Lutfi Muharram", relation: :child, child_order: 4 },
  { source: "Didin Muhyiddin", target: "Siti Zenab Nurlaila", relation: :child, child_order: 5 },
  { source: "Euis Djulaeha", target: "Siti Zenab Nurlaila", relation: :child, child_order: 5 },
  { source: "Didin Muhyiddin", target: "Muhammad Firmansyah", relation: :child, child_order: 6 },
  { source: "Euis Djulaeha", target: "Muhammad Firmansyah", relation: :child, child_order: 6 },
  { source: "Didin Muhyiddin", target: "Ami Kulsum", relation: :child, child_order: 7 },
  { source: "Euis Djulaeha", target: "Ami Kulsum", relation: :child, child_order: 7 },
  { source: "Imas Nur Asiah", target: "Siti Mardiyah Ulfah", relation: :child, child_order: 1 },
  { source: "Yayan Supriatna", target: "Siti Mardiyah Ulfah", relation: :child, child_order: 1 },
  { source: "Imas Nur Asiah", target: "Nura Shofa Marwiyyah", relation: :child, child_order: 2 },
  { source: "Yayan Supriatna", target: "Nura Shofa Marwiyyah", relation: :child, child_order: 2 },
  { source: "Imas Nur Asiah", target: "Kashimah Adawiyah", relation: :child, child_order: 3 },
  { source: "Yayan Supriatna", target: "Kashimah Adawiyah", relation: :child, child_order: 3 },
  { source: "Imas Nur Asiah", target: "Adzharussyukri", relation: :child, child_order: 4 },
  { source: "Yayan Supriatna", target: "Adzharussyukri", relation: :child, child_order: 4 },
  { source: "Rizal Yusup Ramdhan", target: "Roza Dira Haqi", relation: :child, child_order: 1 },
  { source: "Dian Sudiarni", target: "Roza Dira Haqi", relation: :child, child_order: 1 },
  { source: "Rizal Yusup Ramdhan", target: "Aliya Dira Kholqi", relation: :child, child_order: 2 },
  { source: "Dian Sudiarni", target: "Aliya Dira Kholqi", relation: :child, child_order: 2 },
  { source: "Ahmad Farid", target: "Ummu Hawa Assa'diyah", relation: :child, child_order: 1 },
  { source: "Lina Rosdiana", target: "Ummu Hawa Assa'diyah", relation: :child, child_order: 1 },
  { source: "Lutfi Muharram", target: "Adam Ibrahim Alfath", relation: :child, child_order: 1 },
  { source: "Ety Lestari", target: "Adam Ibrahim Alfath", relation: :child, child_order: 1 },
  { source: "Lutfi Muharram", target: "Alif Rahmatullah", relation: :child, child_order: 2 },
  { source: "Ety Lestari", target: "Alif Rahmatullah", relation: :child, child_order: 2 },
  { source: "Lutfi Muharram", target: "Laila Rahmah", relation: :child, child_order: 3 },
  { source: "Ety Lestari", target: "Laila Rahmah", relation: :child, child_order: 3 },
  { source: "Lutfi Muharram", target: "Laula Rizky", relation: :child, child_order: 4 },
  { source: "Ety Lestari", target: "Laula Rizky", relation: :child, child_order: 4 },
  { source: "Rosmana Kurniadi", target: "Arriba Gissani", relation: :child, child_order: 1 },
  { source: "Siti Zenab Nurlaila", target: "Arriba Gissani", relation: :child, child_order: 1 },
  { source: "Muhammad Firmansyah", target: "Tsabita Putri", relation: :child, child_order: 1 },
  { source: "Suci Trisiani Ajeng Purwandani", target: "Tsabita Putri", relation: :child, child_order: 1 },
  { source: "Asep Rijwan Suhendi", target: "Abdan Syakuuro", relation: :child, child_order: 1 },
  { source: "Ami Kulsum", target: "Abdan Syakuuro", relation: :child, child_order: 1 },
  { source: "Asep Rijwan Suhendi", target: "Aqila Tamamah Sya'diyatuddaraini", relation: :child, child_order: 2 },
  { source: "Ami Kulsum", target: "Aqila Tamamah Sya'diyatuddaraini", relation: :child, child_order: 2 },
  { source: "Mochammad Rifa", target: "Asla Aliza Afkariyah", relation: :child, child_order: 1 },
  { source: "Siti Mardiyah Ulfah", target: "Asla Aliza Afkariyah", relation: :child, child_order: 1 },
  { source: "Mochammad Rifa", target: "Aisya Syuba Mahdiyah", relation: :child, child_order: 2 },
  { source: "Siti Mardiyah Ulfah", target: "Aisya Syuba Mahdiyah", relation: :child, child_order: 2 },
  { source: "Roswandi", target: "Abyan Athhar", relation: :child, child_order: 1 },
  { source: "Nura Shofa Marwiyyah", target: "Abyan Athhar", relation: :child, child_order: 1 },
  { source: "Risman Rismansyah", target: "Muhammad Ryuma Syahdira", relation: :child, child_order: 1 },
  { source: "Roza Dira Haqi", target: "Muhammad Ryuma Syahdira", relation: :child, child_order: 1 },
  { source: "Mohamad Musa", target: "Amira Shofia Mecca", relation: :child, child_order: 1 },
  { source: "Ummu Hawa Assa'diyah", target: "Amira Shofia Mecca", relation: :child, child_order: 1 },
  { source: "Adam Ibrahim Alfath", target: "Aydan Muhammad Mulk", relation: :child, child_order: 1 },
  { source: "Muna ilfa Salsabila", target: "Aydan Muhammad Mulk", relation: :child, child_order: 1 },
  { source: "Adam Ibrahim Alfath", target: "Nuzha Athalla Muadz", relation: :child, child_order: 2 },
  { source: "Muna ilfa Salsabila", target: "Nuzha Athalla Muadz", relation: :child, child_order: 2 },
  { source: "Alif Rahmatullah", target: "Shireen Jenna Rumaisya", relation: :child, child_order: 1 },
  { source: "Diva Lizetiany", target: "Shireen Jenna Rumaisya", relation: :child, child_order: 1 },
  { source: "Ibnu Fikri Pamungkas", target: "Aabida Karimah Al Mas'udah", relation: :child, child_order: 1 },
  { source: "Arriba Gissani", target: "Aabida Karimah Al Mas'udah", relation: :child, child_order: 1 },
  { source: "Muhammad Firmansyah", target: "Tsabita Putri", relation: :child, child_order: 1 },
  { source: "Suci Trisiani Ajeng Purwandani", target: "Tsabita Putri", relation: :child, child_order: 1 },
  { source: "Asep Rijwan Suhendi", target: "Abdan Syakuuro", relation: :child, child_order: 1 },
  { source: "Ami Kulsum", target: "Abdan Syakuuro", relation: :child, child_order: 1 },
  { source: "Asep Rijwan Suhendi", target: "Aqila Tamamah Sya'diyatuddaraini", relation: :child, child_order: 2 },
  { source: "Ami Kulsum", target: "Aqila Tamamah Sya'diyatuddaraini", relation: :child, child_order: 2 }
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
