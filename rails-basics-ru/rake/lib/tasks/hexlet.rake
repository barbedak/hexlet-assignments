require 'csv'

namespace :hexlet do
  desc "Import users from CVS file"
  task :import_users, [:file_path] => :environment do |t, args|
    file = args[:file_path]
    p "File path: #{file}"
    arr_of_arrs = CSV.read(file)
    arr_of_arrs[1..-1].each do |row|
      first_name, last_name, birthday, email = row
      User.create(first_name: first_name, last_name: last_name, birthday: Date.strptime(birthday,'%m/%d/%Y'), email: email)
    end
  end

end
