members = [ { name: "Pipih Sopiah", gender: "female" }, { name: "R. Wachyu Yulianto", gender: "male" }, { name: "Aida Sri Yulistiani", gender: "female" }, { name: "Abdul Sobur", gender: "male" }, { name: "Ineu Herlinawati", gender: "female" }, { name: "Asep", gender: "male" }, { name: "Erwin Solahudin", gender: "male" },
  { name: "Iin Haniyati", gender: "female" }, { name: "Irwan Firmansyah", gender: "male" }, { name: "Dina Kamalasari", gender: "female" }, { name: "Indri Sri Wahyuni", gender: "female" }, { name: "Windu Triarto", gender: "male" }, { name: "Amelia Nur Fauza", gender: "female" }, { name: "Rizki Mulfirmansyah", gender: "male" },
  { name: "Fawwaz Muhammad Naufal", gender: "male" }, { name: "Hilma Nadia Yulian", gender: "female" }, { name: "Angga Muchammad Ramdhan", gender: "male" }, { name: "Shafa Nur Athiyyah Zahra", gender: "female" }, { name: "Aqila Muhammad Daffa", gender: "female" }, { name: "Muhammad Najib Al Fatih", gender: "male" } ]
members.each do |member|
  first_name = member[:name].downcase.split(" ").first
  full_email = "#{first_name}@family-tree.com"
  user = User.find_or_initialize_by(email: full_email, full_name: member[:name], gender: member[:gender])
  user.password = "f4m1lyTr33"
  user.save
end
