# config valid for current version and patch releases of Capistrano
lock '~> 3.19.1'

set :application, 'home_dashboard'
set :repo_url, 'git@github.com:f1nwe/home_dashboard.git'

set :deploy_to, "/home/f1nwe/apps/#{fetch(:application)}"

append(
  :linked_dirs,
  'log',
  'tmp/pids',
  'tmp/cache',
  'tmp/sockets',
  'vendor/bundle',
  '.bundle',
  'public/system',
  'public/uploads',
  '.docker'
)

append(
  :linked_files,
  'config/master.key'
)

set :keep_releases, 3

namespace :deploy do
  desc 'Run the build script'
  task :run_build_script do
    on roles(:app) do
      within release_path do
        execute "./build.sh docker-compose.#{fetch(:stage)}.yml"
      end
    end
  end

  after 'deploy:updated', 'deploy:run_build_script'
end

set(
  :decompose_rake_tasks,
  [
    'decompose:down',
    'decompose:up',
    'assets:precompile',
    'db:migrate'
  ]
)
