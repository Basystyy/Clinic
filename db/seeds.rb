Category.create(name: 'General Practitioner') unless Category.exists?(id: 1)

User.create(phone: '+380671234568',
            password: '111111',
            password_confirmation: '111111')

Doctor.create(phone: '+380501234569',
              password: '111111',
              password_confirmation: '111111',
              category_id: 1)

AdminUser.create(phone: '+380987654322',
                 password: '111111',
                 password_confirmation: '111111')

Appointment.create(user_id: 1,
                    doctor_id: 1,
                    date: Time.now,
                    recommendation: "Test",
                    closed: true)