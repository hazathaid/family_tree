members = [ { name: "Pipih Sopiah", gender: "female" }, { name: "R. Wachyu Yulianto", gender: "male" }, { name: "Aida Sri Yulistiani", gender: "female" }, { name: "Abdul Sobur", gender: "male" }, { name: "Ineu Herlinawati", gender: "female" }, { name: "Asep", gender: "male" }, { name: "Erwin Solahudin", gender: "male" },
  { name: "Iin Haniyati", gender: "female" }, { name: "Irwan Firmansyah", gender: "male" }, { name: "Dina Kamalasari", gender: "female" }, { name: "Indri Sri Wahyuni", gender: "female" }, { name: "Windu Triarto", gender: "male" }, { name: "Amelia Nur Fauza", gender: "female" }, { name: "Rizki Mulfirmansyah", gender: "male" },
  { name: "Fawwaz Muhammad Naufal", gender: "male" }, { name: "Hilma Nadia Yulian", gender: "female" }, { name: "Angga Muchammad Ramdhan", gender: "male" }, { name: "Shafa Nur Athiyyah Zahra", gender: "female" }, { name: "Aqila Muhammad Daffa", gender: "female" }, { name: "Muhammad Najib Al Fatih", gender: "male" },
  { name: "Muhammad Abrisam Al Farizy", gender: "male" }, { name: "Nabila Humaira Azzahra", gender: "female" }, { name: "Mochamad Rafka Putra Pratama", gender: "male" }, { name: "Mochamad Razka Dwi Putra", gender: "male" }, { name: "Muhammad Abrisam Al Farizy", gender: "male" }, { name: "Nabila Humaira Azzahra", gender: "female" },
  { name: "Mochamad Rafka Putra Pratama", gender: "male" }, { name: "Mochamad Razka Dwi Putra", gender: "male" },]
members.each do |member|
  first_name = member[:name].downcase.split(" ").first
  full_email = "#{first_name}@family-tree.com"
  user = User.find_or_initialize_by(email: full_email, full_name: member[:name], gender: member[:gender])
  user.password = "f4m1lyTr33"
  user.save
end
relationships = [
  # spouse
  { source: "Pipih Sopiah", target: "R. Wachyu Yulianto", relation: :spouse },
  { source: "Aida Sri Yulistiani", target: "Abdul Sobur", relation: :spouse },
  { source: "Ineu Herlinawati", target: "Asep", relation: :spouse },
  { source: "Erwin Solahudin", target: "Iin Haniyati", relation: :spouse },
  { source: "Irwan Firmansyah", target: "Dina Kamalasari", relation: :spouse },
  { source: "Indri Sri Wahyuni", target: "Windu Triarto", relation: :spouse },
  { source: "Amelia Nur Fauza", target: "Rizki Mulfirmansyah", relation: :spouse },
  { source: "Hilma Nadia Yulian", target: "Angga Muchammad Ramdhan", relation: :spouse },

  # child
  { source: "Pipih Sopiah", target: "Aida Sri Yulistiani", relation: :child, child_order: 1 },
  { source: "R. Wachyu Yulianto", target: "Aida Sri Yulistiani", relation: :child, child_order: 1 },
  { source: "Pipih Sopiah", target: "Erwin Solahudin", relation: :child, child_order: 2 },
  { source: "R. Wachyu Yulianto", target: "Erwin Solahudin", relation: :child, child_order: 2 },
  { source: "Pipih Sopiah", target: "Irwan Firmansyah", relation: :child, child_order: 3 },
  { source: "R. Wachyu Yulianto", target: "Irwan Firmansyah", relation: :child, child_order: 3 },
  { source: "Pipih Sopiah", target: "Indri Sri Wahyuni", relation: :child, child_order: 4 },
  { source: "R. Wachyu Yulianto", target: "Indri Sri Wahyuni", relation: :child, child_order: 4 },
  { source: "Aida Sri Yulistiani", target: "Amelia Nur Fauza", relation: :child, child_order: 1 },
  { source: "Abdul Sobur", target: "Amelia Nur Fauza", relation: :child, child_order: 1 },
  { source: "Aida Sri Yulistiani", target: "Fawwaz Muhammad Naufal", relation: :child, child_order: 2 },
  { source: "Abdul Sobur", target: "Fawwaz Muhammad Naufal", relation: :child, child_order: 2 },
  { source: "Ineu Herlinawati", target: "Hilma Nadia Yulian", relation: :child, child_order: 1 },
  { source: "Asep", target: "Hilma Nadia Yulian", relation: :child, child_order: 1 },
  { source: "Erwin Solahudin", target: "Shafa Nur Athiyyah Zahra", relation: :child, child_order: 1 },
  { source: "Iin Haniyati", target: "Shafa Nur Athiyyah Zahra", relation: :child, child_order: 1 },
  { source: "Erwin Solahudin", target: "Aqila Muhammad Daffa", relation: :child, child_order: 2 },
  { source: "Iin Haniyati", target: "Aqila Muhammad Daffa", relation: :child, child_order: 2 },
  { source: "Irwan Firmansyah", target: "Muhammad Najib Al Fatih", relation: :child, child_order: 1 },
  { source: "Dina Kamalasari", target: "Muhammad Najib Al Fatih", relation: :child, child_order: 1 },
  { source: "Irwan Firmansyah", target: "Muhammad Abrisam Al Farizy", relation: :child, child_order: 2 },
  { source: "Dina Kamalasari", target: "Muhammad Abrisam Al Farizy", relation: :child, child_order: 2 }
  { source: "Irwan Firmansyah", target: "Nabila Humaira Azzahra", relation: :child, child_order: 3 },
  { source: "Dina Kamalasari", target: "Nabila Humaira Azzahra", relation: :child, child_order: 3 }
  { source: "Indri Sri Wahyuni", target: "Mochamad Rafka Putra Pratama", relation: :child, child_order: 1 },
  { source: "Windu Triarto", target: "Mochamad Rafka Putra Pratama", relation: :child, child_order: 1 },
  { source: "Indri Sri Wahyuni", target: "Mochamad Razka Dwi Putra", relation: :child, child_order: 2 },
  { source: "Windu Triarto", target: "Mochamad Razka Dwi Putra", relation: :child, child_order: 2 }
  { source: "Amelia Nur Fauza", target: "Muhammad Elfarezh Mulfaza", relation: :child, child_order: 1 },
  { source: "Rizki Mulfirmansyah", target: "Muhammad Elfarezh Mulfaza", relation: :child, child_order: 1 },
  { source: "Amelia Nur Fauza", target: "Muhammad Alkhawarizmy", relation: :child, child_order: 2 },
  { source: "Rizki Mulfirmansyah", target: "Muhammad Alkhawarizmy", relation: :child, child_order: 2 },
  { source: "Amelia Nur Fauza", target: "Muhammad Atharrazka", relation: :child, child_order: 3 },
  { source: "Rizki Mulfirmansyah", target: "Muhammad Atharrazka", relation: :child, child_order: 3 },
  { source: "Hilma Nadia Yulian", target: "Naqysha Nursyifa Anindya", relation: :child, child_order: 1 },
  { source: "Angga Muchammad Ramdhan", target: "Naqysha Nursyifa Anindya", relation: :child, child_order: 1 },
  { source: "Hilma Nadia Yulian", target: "Alby Muhammad Farsyad", relation: :child, child_order: 2 },
  { source: "Angga Muchammad Ramdhan", target: "Alby Muhammad Farsyad", relation: :child, child_order: 2 },
  { source: "Hilma Nadia Yulian", target: "Muhammad Baihaqqi Dzakiyulhaq", relation: :child, child_order: 3 },
  { source: "Angga Muchammad Ramdhan", target: "Muhammad Baihaqqi Dzakiyulhaq", relation: :child, child_order: 3 },
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