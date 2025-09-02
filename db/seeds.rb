unless User.find_by(phone: '+380671234567')
  User.create!(
    phone: '+380671234567',
    password: 'password123',
    role: 'admin',
    confirmed_at: Time.current
  )
end
