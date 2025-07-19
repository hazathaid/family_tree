members = [ { name: "Uwesulkorni", gender: "male" }, { name: "Neneng Haerani", gender: "female" }, { name: "Reni Kurniawati", gender: "female" }, { name: "Agus Supriadi", gender: "male" }, { name: "Rina Yuniawati", gender: "female" }, { name: "Rachman", gender: "male" }, { name: "Denti Sofiatul Jannah", gender: "female" },
  { name: "Agus Ahmadyani", gender: "male" }, { name: "Devi Firdaus Fauzi", gender: "male" }, { name: "Rani Apriyanti", gender: "female" }, { name: "Salmaa Felia Mentari", gender: "female" }, { name: "Salwaa Aulia Pelangi", gender: "female" }, { name: "Muhammad Fadhillah Dinurahman", gender: "male" }, { name: "Muhammad Nabil Adzikrullah", gender: "male" },
  { name: "Muhammad Nur Ikhsan Kamil", gender: "male" }, { name: "Syaqiyya Kahayasa Putri Agustina", gender: "female" }, { name: "Zhafira Khanza Humaira Agustina", gender: "female" }, { name: "Ayesha Dhafia Rumaiza Agustina", gender: "female" }, { name: "Muhammad Zaid Nur Fauzi", gender: "male" }, { name: "Muhammad Thariq Al Fauzi", gender: "male" },
  { name: "Siti Hanifah Muslimah Fauzi", gender: "female" } ]
members.each do |member|
  first_name = member[:name].downcase.split(" ").first
  full_email = "#{first_name}@family-tree.com"
  user = User.find_or_initialize_by(email: full_email, full_name: member[:name], gender: member[:gender])
  user.password = "f4m1lyTr33"
  user.save
end
relationships = [
  # spouse
  { source: "Uwesulkorni", target: "Neneng Haerani", relation: :spouse },
  { source: "Reni Kurniawati", target: "Agus Supriadi", relation: :spouse },
  { source: "Rina Yuniawati", target: "Rachman", relation: :spouse },
  { source: "Denti Sofiatul Jannah", target: "Agus Ahmadyani", relation: :spouse },
  { source: "Devi Firdaus Fauzi", target: "Rani Apriyanti", relation: :spouse },

  # child
  { source: "Uwesulkorni", target: "Imas Nur Asiah", relation: :child, child_order: 1 },
  { source: "Neneng Haerani", target: "Imas Nur Asiah", relation: :child, child_order: 1 },
  { source: "Uwesulkorni", target: "Rizal Yusup Ramdhan", relation: :child, child_order: 2 },
  { source: "Neneng Haerani", target: "Rizal Yusup Ramdhan", relation: :child, child_order: 2 },
  { source: "Uwesulkorni", target: "Ahmad Farid", relation: :child, child_order: 3 },
  { source: "Neneng Haerani", target: "Ahmad Farid", relation: :child, child_order: 3 },
  { source: "Uwesulkorni", target: "Lutfi Muharram", relation: :child, child_order: 4 },
  { source: "Neneng Haerani", target: "Lutfi Muharram", relation: :child, child_order: 4 },
  { source: "Reni Kurniawati", target: "Salmaa Felia Mentari", relation: :child, child_order: 1 },
  { source: "Agus Supriadi", target: "Salmaa Felia Mentari", relation: :child, child_order: 1 },
  { source: "Reni Kurniawati", target: "Salwaa Aulia Pelangi", relation: :child, child_order: 2 },
  { source: "Agus Supriadi", target: "Salwaa Aulia Pelangi", relation: :child, child_order: 2 }
  { source: "Rina Yuniawati", target: "Muhammad Fadhillah Dinurahman", relation: :child, child_order: 1 },
  { source: "Rachman", target: "Muhammad Fadhillah Dinurahman", relation: :child, child_order: 1 },
  { source: "Rina Yuniawati", target: "Muhammad Nabil Adzikrullah", relation: :child, child_order: 2 },
  { source: "Rachman", target: "Muhammad Nabil Adzikrullah", relation: :child, child_order: 2 }
  { source: "Rina Yuniawati", target: "Muhammad Nur Ikhsan Kamil", relation: :child, child_order: 3 },
  { source: "Rachman", target: "Muhammad Nur Ikhsan Kamil", relation: :child, child_order: 3 }
  { source: "Denti Sofiatul Jannah", target: "Syaqiyya Kahayasa Putri Agustina", relation: :child, child_order: 1 },
  { source: "Agus Ahmadyani", target: "Syaqiyya Kahayasa Putri Agustina", relation: :child, child_order: 1 },
  { source: "Denti Sofiatul Jannah", target: "Zhafira Khanza Humaira Agustina", relation: :child, child_order: 2 },
  { source: "Agus Ahmadyani", target: "Zhafira Khanza Humaira Agustina", relation: :child, child_order: 2 }
  { source: "Denti Sofiatul Jannah", target: "Ayesha Dhafia Rumaiza Agustina", relation: :child, child_order: 3 },
  { source: "Agus Ahmadyani", target: "Ayesha Dhafia Rumaiza Agustina", relation: :child, child_order: 3 }
  { source: "Devi Firdaus Fauzi", target: "Muhammad Zaid Nur Fauzi", relation: :child, child_order: 1 },
  { source: "Rani Apriyanti", target: "Muhammad Zaid Nur Fauzi", relation: :child, child_order: 1 },
  { source: "Devi Firdaus Fauzi", target: "Muhammad Thariq Al Fauzi", relation: :child, child_order: 2 },
  { source: "Rani Apriyanti", target: "Muhammad Thariq Al Fauzi", relation: :child, child_order: 2 }
  { source: "Devi Firdaus Fauzi", target: "Siti Hanifah Muslimah Fauzi", relation: :child, child_order: 3 },
  { source: "Rani Apriyanti", target: "Siti Hanifah Muslimah Fauzi", relation: :child, child_order: 3 }
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
