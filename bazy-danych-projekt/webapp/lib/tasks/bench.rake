task :bench => :environment do
  Db::Project.all.each {|e| e.destroy }

end
