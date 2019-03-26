desc "Remove guest accounts more than a week old."
  task :shedudler => :environment do
  	User.where(guest: true).where(['created_at < ?', 7.days.ago]).destroy_all
  end