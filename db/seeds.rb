# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


100.times do
a = 1+rand(100)
b = 1+rand(100)
r = a+b
wr = r+rand(100)
s = "What is "
s += a.to_s
s += " + "
s += b.to_s
s += "?"
s1 = "It's "
s1 += r.to_s
s1 += "."
s2 = "It's "
s2 += wr.to_s
s2 += "."
Question.create(problem: s, correct_answer: s1, wrong_answers: s2, category: "Math")
end
