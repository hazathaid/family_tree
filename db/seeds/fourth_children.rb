members = [ { name: "Amir Sidik", gender: "male" }, { name: "Tini Kusmiati", gender: "female" }, { name: "Ratih Surtikanti", gender: "female" }, { name: "Cecep Suhendi", gender: "male" }, { name: "Rizkarima", gender: "female" }, { name: "Iwan Kurniawan", gender: "male" }, { name: "Gundar Kolyubi", gender: "male" },
  { name: "Putri Nurlaela Hasan", gender: "female" }, { name: "Adhara Musyaffa Bilal", gender: "male" }, { name: "Aldebaran Ujabi bariq", gender: "male" }, { name: "Shaula Naazneen Bahia", gender: "female" }, { name: "Iesha Prameswari Lathofa", gender: "female" }, { name: "Iklima Pramesti Almahyra", gender: "female" }, { name: "Ikram Pramudya Al-Fatih", gender: "male" },
  { name: "Fazura Arzeti Kolyubi", gender: "female" }, { name: "Khalid Khairy Kolyubi", gender: "male" }, { name: "Fazira Ayra Kolyubi", gender: "female" } ]
members.each do |member|
  first_name = member[:name].downcase.split(" ").first
  full_email = "#{first_name}@family-tree.com"
  user = User.find_or_initialize_by(email: full_email, full_name: member[:name], gender: member[:gender])
  user.password = "f4m1lyTr33"
  user.save
end
