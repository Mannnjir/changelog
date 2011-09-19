namespace :changelog do

  desc "Adds pivotal tracker stories to empty release versions"
  task  :build => :environment do
    p 'Adding stories..'
    Changelog::Release.build_version_stories
    p 'Task completed'
  end

  desc "Clears changelog versions from stories and repopulates it with pivotal tracker stories"
  task :rebuild => :environment do
    Changelog::Release.build_version_stories(true)
    p 'Task completed'
  end

end
