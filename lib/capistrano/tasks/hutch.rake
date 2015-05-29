namespace :load do
  task :defaults do
    set :hutch_role, -> { :worker }
    set :hutch_default_hooks, -> { true }
    set :hutch_pid_pattern, -> { File.join(shared_path, 'tmp', 'pids', 'hutch*.pid') }
    set :hutch_config, -> { File.join(shared_path, 'config', 'hutch.yml') }
    set :hutch_env, -> { fetch(:rails_env, fetch(:rack_env, fetch(:stage))) }
  end
end

namespace :deploy do
  after :publishing, :restart_hutch do
    invoke 'hutch:stop' if fetch(:hutch_default_hooks)
  end
end

namespace :hutch do
  desc 'Stop hutch'
  task :stop do
    on roles fetch(:hutch_role) do
      stop_hutch
    end
  end

  def stop_hutch
    execute "kill -TERM `cat #{fetch :hutch_pid_pattern}`"
  end

#  def start_hutch
#    args = []
#    args.push "--pidfile #{fetch :hutch_pid}"
#    args.push "--config #{fetch :hutch_config}"
#    args.push '--daemon'
#    args.push fetch(:hutch_options) if fetch(:hutch_options)
#
#    execute :bundle, :exec, :hutch, args.compact.join(' ')
#  end
#
end
