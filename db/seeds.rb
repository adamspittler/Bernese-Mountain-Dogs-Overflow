users= [ {username: "Rubiksdude", email: "rubiks@dude.wow", password: "123456" },{username: "Henri", email: "henri@gmail.com", password: "henri"}, {username: "fluffy", email: "fluffy@email.com", password: "fluffy"} ,{username: "pig wilson", email: "spittler@gmail.com", password: "password",breed: "cat"}
]

User.create!(users)

questions= [ {title: "Where is my owner?", text: "Halp, my ownr disapear 5ever plz halp",user_id: 1},{title: "What's that smell?", text: "I JUSS WANNA SMEL IT",user_id: 1},{title: "Why won't the dog on the tv answer me?", text: "HEY, HEY, HEY!!! NOTICE ME! GRRRRRRRRR",user_id: 2}]

Question.create!(questions)

answers= [ {text: "I DON'T KNOW, I HAV THE SAM PROBLEM!", user_id: 2, question_id: 1, best: true}]

Answer.create!(answers)

comments= [{text: "U GUIZ 2!? WE SHOULD RELLY BAND TOGETHUR!", user_id: 3, commentable_type: "Answer", commentable_id: 1}]

Comment.create!(comments)

votes= [{value: 1, user_id: 2, votable_type: "Answer", votable_id: 1},{value: 1, user_id: 2, votable_type: "Question", votable_id: 1}]

Vote.create!(votes)
