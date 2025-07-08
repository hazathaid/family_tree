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
