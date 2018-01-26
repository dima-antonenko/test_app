namespace :parse do
  Dir[Rails.root.join('db', 'parsers', '*.rb')].each do |filename|
    task_name = File.basename(filename, '.rb')
    desc "Task " + task_name + ", based on the file with the same name in `db/parsers/*.rb`"
    task task_name.to_sym => :environment do
      load(filename) if File.exist?(filename)
    end
  end
end
