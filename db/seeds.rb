# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

leagues = League.create([{name: 'Orem 10-11 year olds'},{name: 'Orem 12-13 year olds'},{name: 'Orem 14-15 year olds'}])
positions = Position.create([ {name: 'coach'},
                              {name: 'pitcher'},
                              {name: 'catcher'},
                              {name: 'first base'},
                              {name: 'second base'},
                              {name: 'short stop'},
                              {name: 'third base'},
                              {name: 'left field'},
                              {name: 'center field'},
                              {name: 'right field'} ])

leagues.each do |l|
  l.divisions.create(:name=>'North')
  l.divisions.create(:name=>'South')
end

Division.all.each do |d|
  for i in 1..10
    d.teams.create(:name=>Faker::Name.first_name)
  end
end

Team.all.each do |t|
  for x in 1..2
    Position.all.each_with_index do |p,i| 
      t.people.create({name: Faker::Name.name, 
                        number: (i*5) + Random.rand(99),
                        position: p,
                        active: true})
    end
  end
end