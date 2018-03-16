begin
    require 'bundler/audit/task'
    Bundler::Audit::Task.new
rescue LoadError
    puts "Skipping loading Bundler Audit Rake task"
end
