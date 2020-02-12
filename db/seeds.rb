# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
backend = Refile::Backend::FileSystem.new("tmp/uploads/store")
original = File.open("app/assets/images/suzu.jpeg", "rb")
file = backend.upload(original)
original.close
original_2 = File.open("app/assets/images/noel.jpeg", "rb")
file_2 = backend.upload(original_2)
original_2.close
original_3 = File.open("app/assets/images/mona.jpeg", "rb")
file_3 = backend.upload(original_3)
original_3.close


User.create! (
  [
    {
      name: "suzu",
      email: "aa@gmail.com",
      password: "654321",
      profile_image_id: file.id,
    },
    {
      name: "noel",
      email: "bb@gmail.com",
      password: "654321",
      profile_image_id: file_2.id,
    },
    {
      name: "mona",
      email: "cc@gmail.com",
      password: "654321",
      profile_image_id: file_3.id,
    }
  ]
)

Book.create! (
  [
    {
      user_id: "1",
      title: "妹ダックス",
      body: "ゴールド",
    },
    {
      user_id: "2",
      title: "お母さんダックス",
      body: "ブラックタン",
    },
    {
      user_id: "3",
      title: "お姉ちゃんダックス",
      body: "ゴールド",
    },
  ]
)

BookComment.create! (
  [
    {
      user_id: "1",
      book_id: "2",
      comment: "ママは私のものよ！",
    },
    {
      user_id: "2",
      book_id: "3",
      comment: "ちょっかい出してこないで！",
    },
    {
      user_id: "3",
      book_id: "1",
      comment: "少しは落ち着きなさい！",
    },
  ]
)