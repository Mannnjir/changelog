namespace :changelog do

  desc "Adds pivotal tracker stories to release versions with given label"
  task  :build, [:label] => :environment do |t, args|
    if args.label.present?
      puts 'Adding stories..'
      Changelog::Release.build_version(args.label)
      puts 'Task completed'
    else
      puts 'No label provaided!'
    end
  end

  desc "Sets 'Unreleased' versions date value to current date."
  task :release => :environment do
    puts 'Updating date..'
    Changelog::Release.update_release_date
    puts 'Task completed'
  end

end
