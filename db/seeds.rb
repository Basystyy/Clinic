Category.find_or_create_by!(name: 'General Practitioner')

User.find_or_create_by!(phone: '+380671234568') do |u|
  u.password = '111111'
  u.password_confirmation = '111111'
end

Doctor.find_or_create_by!(phone: '+380501234569') do |d|
  d.password = '111111'
  d.password_confirmation = '111111'
  d.category_id = Category.find_by(name: 'General Practitioner').id
end

AdminUser.find_or_create_by!(phone: '+380987654322') do |a|
  a.password = '111111'
  a.password_confirmation = '111111'
end
