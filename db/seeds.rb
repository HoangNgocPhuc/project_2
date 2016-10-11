User.create(name: "Gin", email: "darkdragon236@gmail.com",
    password: "123456", password_confirmation: "123456", role: 1)

(1..20).each do |i|
  User.create(name: "sampleuser#{i}", email: "example#{i}@gmail.com",
    password: "123456", password_confirmation: "123456")
end
