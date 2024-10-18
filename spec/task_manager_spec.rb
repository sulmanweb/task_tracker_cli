require 'rspec'
require_relative '../lib/task_manager'

RSpec.describe TaskManager do
  let(:task_manager) { TaskManager.new }

  before(:each) do
    File.delete(TaskManager::TASKS_FILE) if File.exist?(TaskManager::TASKS_FILE)
  end

  describe '#create_task' do
    it 'creates a new task successfully' do
      task_manager.create_task('Test Task')
      expect(task_manager.send(:load_tasks).size).to eq(1)
      expect(task_manager.send(:load_tasks).first.description).to eq('Test Task')
    end
  end

  describe '#list_tasks' do
    it 'lists all tasks' do
      task_manager.create_task('Task 1')
      task_manager.create_task('Task 2')
      expect { task_manager.list_tasks }.to output(/Task 1/).to_stdout
      expect { task_manager.list_tasks }.to output(/Task 2/).to_stdout
    end
  end

  describe '#update_task' do
    it 'updates an existing task' do
      task_manager.create_task('Original Task')
      task_manager.update_task(1, 'Updated Task')
      expect(task_manager.send(:load_tasks).first.description).to eq('Updated Task')
    end

    it 'outputs an error when task is not found' do
      expect { task_manager.update_task(99, 'Non-existent Task') }.to output(/Task not found/).to_stdout
    end
  end

  describe '#delete_task' do
    it 'deletes a task successfully' do
      task_manager.create_task('Task to Delete')
      task_manager.delete_task(1)
      expect(task_manager.send(:load_tasks).size).to eq(0)
    end

    it 'outputs an error when task is not found' do
      expect { task_manager.delete_task(99) }.to output(/Task not found/).to_stdout
    end
  end

  describe '#mark_in_progress' do
    it 'marks a task as in progress' do
      task_manager.create_task('Task to Mark')
      task_manager.mark_in_progress(1)
      expect(task_manager.send(:load_tasks).first.status).to eq('in-progress')
    end
  end

  describe '#mark_done' do
    it 'marks a task as done' do
      task_manager.create_task('Task to Complete')
      task_manager.mark_done(1)
      expect(task_manager.send(:load_tasks).first.status).to eq('done')
    end
  end
end
