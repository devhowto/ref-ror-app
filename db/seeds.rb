#
# This file should contain all the record creation needed to seed the
# database with its default values. The data can then be loaded with the
# bin/rails `db:seed`  command (or created alongside the database with
# db:setup).
#

user1 = User.create email: 'yoda@dev.io', password: '1234'

Category.create(
  [
    {
      id: 1,
      name: 'Programming'
    },
    {
      id: 2,
      name: 'Command Line'
    },
    {
      id: 3,
      name: 'Haskell'
    }
  ]
)

category1 = Category.find(1)
category2 = Category.find(2)
category3 = Category.find(3)

Article.create(
  [
    {
      id: 1,
      title: 'Functional Programming',
      body: 'The joys of ...',
      user: user1,
      categories: [category1, category3]
    },
    {
      id: 2,
      title: 'PureScript for the grown-ups',
      body: 'PureScript was created by...',
      user: user1,
      categories: [category2]
    },
    {
      id: 3,
      title: 'Bash tips and tricks',
      body: 'What about we investigate cool, little known bash stuff‽',
      user: user1,
      categories: [category1, category3]
    }
  ]
)
