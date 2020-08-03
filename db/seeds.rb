# 管理者userにadmin権限を追加
User.create!(name: "管理者",
            email: "sample@email.com",
            password: "password",
            password_confirmation: "password",
            admin: true)
            