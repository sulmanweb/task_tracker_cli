# Task Tracker CLI

Built by [Sulman Baig](https://www.sulmanweb.com)

> This project requirements are from [Task Tracker Roadmap.sh](https://roadmap.sh/projects/task-tracker)

Task Tracker CLI is a Ruby gem that provides a command-line interface for managing your tasks and to-do list. It allows you to easily add, update, delete, and track the status of your tasks directly from the terminal.

## Features

- Add new tasks
- Update existing tasks
- Delete tasks
- Mark tasks as in-progress or done
- List all tasks
- List tasks by status (todo, in-progress, done)
- Persistent storage using JSON file in home directory

## Requirements

- Ruby version: 2.5.0 or higher

## Installation

Ensure you have Ruby 2.5.0 or higher installed. You can check your Ruby version by running:

```
ruby --version
```

If you need to install or update Ruby, visit the [official Ruby website](https://www.ruby-lang.org/en/documentation/installation/) for instructions.

Install the gem by running:

```
gem install task_tracker_cli
```

## Usage

After installation, you can use the `task-cli` command in your terminal to manage your tasks:

### Adding a new task

```
task-cli add "Task description"
```

### Updating a task

```
task-cli update 1 "Updated task description"
```

### Deleting a task

```
task-cli delete 1
```

### Marking a task as in-progress

```
task-cli in-progress 1
```

### Marking a task as done

```
task-cli done 1
```

### Listing all tasks

```
task-cli list
```

### Listing tasks by status


```
task-cli list todo
```

```
task-cli list in-progress
```

```
task-cli list done
```

## Uninstallation

To uninstall the gem, run:

```
gem uninstall task_tracker_cli
```

## Task Properties

Each task has the following properties:

- `id`: A unique identifier for the task
- `description`: A short description of the task
- `status`: The status of the task (`todo`, `in-progress`, `done`)
- `createdAt`: The date and time when the task was created
- `updatedAt`: The date and time when the task was last updated

## File Storage

Tasks are stored in a JSON file (`tasks.json`) in your home directory. This file is automatically created if it doesn't exist.

## Development

After cloning the repository, follow these steps to set up the development environment:

1. Install dependencies:
   ```
   bundle install
   ```

2. Run the tests:
   ```
   rspec
   ```

3. To install this gem onto your local machine, run:
   ```
   gem build task_tracker_cli.gemspec
   gem install ./task_tracker_cli-0.1.0.gem
   ```

4. To release a new version, update the version number in `task_tracker_cli.gemspec`, and then run:
   ```
   gem build task_tracker_cli.gemspec
   gem push task_tracker_cli-0.1.0.gem
   ```

For development, you can use `irb` or `pry` to experiment with the code:

```ruby
require 'task_tracker_cli'
task_manager = TaskManager.new
# Now you can experiment with task_manager methods
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sulmanweb/task_tracker_cli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/sulmanweb/task_tracker_cli/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Task Tracker CLI project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/sulmanweb/task_tracker_cli/blob/main/CODE_OF_CONDUCT.md).
