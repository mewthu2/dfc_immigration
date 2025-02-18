unless Rails.env.production?
  User.create!(name: 'Jesher Minelli', email: 'jesherdevsk8@gmail.com', password: 'senha@123')
end
