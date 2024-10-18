# Task Tracker in Ruby
require 'json'
require 'time'

# Define a Task class to represent each task
class Task
  attr_accessor :id, :description, :status, :created_at, :updated_at

  def initialize(description, status = 'todo')
    @id = nil
    @description = description
    @status = status
    @created_at = Time.now
    @updated_at = Time.now
  end

  def update(description, status)
    @description = description
    @status = status
    @updated_at = Time.now
  end

  def to_h
    {
      id: @id,
      description: @description,
      status: @status,
      created_at: @created_at.to_s,
      updated_at: @updated_at.to_s
    }
  end

  def to_s
    "ID: #{@id} | Description: #{@description} | Status: #{@status} | Created At: #{@created_at} | Updated At: #{@updated_at}"
  end
end

# TaskManager to manage tasks
class TaskManager
  TASKS_FILE = File.join(Dir.home, 'tasks.json')

  def initialize
    @tasks = load_tasks
  end

  def load_tasks
    return [] unless File.exist?(TASKS_FILE)

    file = File.read(TASKS_FILE)
    data = JSON.parse(file, symbolize_names: true)
    data.map do |task_data|
      task = Task.new(task_data[:description], task_data[:status])
      task.id = task_data[:id]
      task.created_at = Time.parse(task_data[:created_at])
      task.updated_at = Time.parse(task_data[:updated_at])
      task
    end
  end

  def save_tasks
    File.open(TASKS_FILE, 'w') do |file|
      file.write(JSON.pretty_generate(@tasks.map(&:to_h)))
    end
  end

  # Create a new task
  def create_task(description)
    task = Task.new(description)
    task.id = @tasks.empty? ? 1 : @tasks.last.id + 1
    @tasks << task
    save_tasks
    puts "Task added successfully (ID: #{task.id})"
  end

  # List all tasks
  def list_tasks
    if @tasks.empty?
      puts "No tasks found.\n"
    else
      @tasks.each { |task| puts task }
    end
  end

  # List tasks by status
  def list_tasks_by_status(status)
    filtered_tasks = @tasks.select { |task| task.status == status }
    if filtered_tasks.empty?
      puts "No tasks found with status '#{status}'."
    else
      filtered_tasks.each { |task| puts task }
    end
  end

  # Find a task by ID
  def find_task(id)
    @tasks.find { |task| task.id == id }
  end

  # Update a task
  def update_task(id, new_description)
    task = find_task(id)
    if task
      task.update(new_description, task.status)
      save_tasks
      puts "Task updated successfully!"
    else
      puts "Task not found."
    end
  end

  # Delete a task
  def delete_task(id)
    task = find_task(id)
    if task
      @tasks.delete(task)
      save_tasks
      puts "Task deleted successfully!"
    else
      puts "Task not found."
    end
  end

  # Mark a task as in progress
  def mark_in_progress(id)
    task = find_task(id)
    if task
      task.update(task.description, 'in-progress')
      save_tasks
      puts "Task marked as in-progress!"
    else
      puts "Task not found."
    end
  end

  # Mark a task as done
  def mark_done(id)
    task = find_task(id)
    if task
      task.update(task.description, 'done')
      save_tasks
      puts "Task marked as done!"
    else
      puts "Task not found."
    end
  end
end
