users= [ {username: "Rubiksdude", email: "rubiks@dude.wow", password: "123456", breed: "laboratory retriever" },{username: "Henri", email: "henri@gmail.com", password: "henri"}, {username: "fluffy", email: "fluffy@email.com", breed: "australian shepherd", password: "fluffy"} ,{username: "pig wilson", email: "spittler@gmail.com", password: "password",breed: "cat"}
]

User.create!(users)

questions= [ {title: "Where is my owner?", text: "Halp, my ownr disapear 5ever plz halp",user_id: 1},{title: "What's that smell?", text: "I JUSS WANNA SMEL IT",user_id: 1},{title: "Why won't the dog on the tv answer me?", text: "HEY, HEY, HEY!!! NOTICE ME! GRRRRRRRRR",user_id: 2},{title: "What are zebras?", text: "R they like us but bigger?",user_id: 4}, {title: "wolves??", text: "r we rly descendants of these JERKS?!?!", user_id: 3}
]

Question.create!(questions)

answers= [{text: "I DON'T KNOW, I HAV THE SAM PROBLEM!", user_id: 2, question_id: 1, best: true},{text: "U GUIZ 2? I KANT BELIEEv THIS!!", user_id: 3, question_id: 1, best: false},{text: "I Don't has this probelem. Did U tri waiting by the doooor?", user_id: 4, question_id: 1, best: false},{text: "U hAVE 2 PANT MOAR!! AT LEAST THAT WORKS FOR MII!", user_id: 2, question_id: 3, best: true},{text: "I'm pretti sur they're moar!", user_id: 2, question_id: 4, best: true}
]

Answer.create!(answers)

comments= [{text: "U GUIZ 2!? WE SHOULD RELLY BAND TOGETHUR!", user_id: 3, commentable_type: "Answer", commentable_id: 1},{text: "I dun understan, plz tranzl8 2 doge speek!", user_id: 4, commentable_type: "Question", commentable_id: 1},{text: "WOW USE DOOGLE TRANSLATE!", user_id: 1, commentable_type: "Question", commentable_id: 1}
]

Comment.create!(comments)

votes= [{value: 1, user_id: 2, votable_type: "Answer", votable_id: 1},{value: 1, user_id: 2, votable_type: "Question", votable_id: 1},{value: 1, user_id: 3, votable_type: "Question", votable_id: 1},{value: -1, user_id: 4, votable_type: "Answer", votable_id: 3}]

Vote.create!(votes)
