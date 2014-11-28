namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		#User.create!(name: "Example User",email: "example@railstutorial.org",password: "foobar",password_confirmation: "foobar")
		r = Random.new
		99.times do |n|
			User.create!(age: r.rand(0..100), pay: r.rand(0..1000000), stature: r.rand(0..200), weigh: r.rand(0..200))
		end
	end
end