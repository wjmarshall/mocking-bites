require "task_formatter"

RSpec.describe TaskFormatter do
  context "when initialized with a task" do
    it "formats the task as incomplete" do
      task = double(:task, title: "My task", complete?: false)
      task_formatter = TaskFormatter.new(task)
      expect(task_formatter.format).to eq("[ ] My task")
    end

    it "reformats tasks when they are completed" do
      task = double(:task, title: "My task", complete?: true)
      task_formatter = TaskFormatter.new(task)
      expect(task_formatter.format).to eq("[x] My task")
    end
  end
end
    

