RUBY_APPS = {
  alpha:    3991,
  beta:     3992,
  charlie:  3993,
  overlord: 3994,
}

task :boot do
  RUBY_APPS.each do |name, port|
    Bundler.with_original_env { system("cd #{name} && bundle install && yarn install && bundle exec rails db:setup") }
  end

  system("bundle exec foreman start")
end

task :run, [:app_name] do |task, args|
  app_name = args[:app_name].to_sym
  Bundler.with_original_env { system("cd #{app_name} && bundle exec rails s -p #{RUBY_APPS[app_name]}") }
end

task :sub, [:app_name] do |task, args|
  app_name = args[:app_name].to_sym
  Bundler.with_original_env { system("cd #{app_name} && bundle exec rake events:subscribe") }
end

task :db_migrate do
  RUBY_APPS.each do |name, port|
    Bundler.with_original_env { system("cd #{name} && bundle install && bundle exec rails db:migrate") }
  end
end
