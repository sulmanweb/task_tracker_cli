require_relative "task_manager"

class TaskCLI
  def self.run
    task_manager = TaskManager.new
    command = ARGV[0]
    args = ARGV[1..-1]

    case command
    when 'add'
      description = args.join(' ')
      task_manager.create_task(description)
    when 'update'
      id = args[0].to_i
      new_description = args[1..-1].join(' ')
      task_manager.update_task(id, new_description)
    when 'delete'
      id = args[0].to_i
      task_manager.delete_task(id)
    when 'mark-in-progress'
      id = args[0].to_i
      task_manager.mark_in_progress(id)
    when 'mark-done'
      id = args[0].to_i
      task_manager.mark_done(id)
    when 'list'
      if args.empty?
        task_manager.list_tasks
      else
        status = args[0]
        task_manager.list_tasks_by_status(status)
      end
    when 'init'
      self.init_project
    else
      puts "Invalid command. Available commands: add, update, delete, mark-in-progress, mark-done, list, init"
    end
  end

  def self.init_project
    directories = ["tasks", "config", "logs"]
    files = {
      "config/settings.json" => '{"setting": "default"}',
      "README.md" => "# Task Tracker CLI Project\n\nThis is your task tracker project. Modify this README accordingly."
    }

    directories.each do |dir|
      Dir.mkdir(dir) unless Dir.exist?(dir)
      puts "Created directory: #{dir}"
    end

    files.each do |file, content|
      File.open(file, 'w') { |f| f.write(content) }
      puts "Created file: #{file}"
    end
  end
end
