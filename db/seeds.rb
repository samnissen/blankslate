# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# Task Types
# params.require(:task_type).permit(:name, :setup, :teardown)

browsing_setup = <<-EOS
  if OS.linux?
    @headless = Headless.new
    @headless.start
  end
  
  @browser = Watir::Browser.new (ENV['BLANKSLATEBROWSERTYPE'] || :firefox)
EOS
browsing_teardown = <<-EOS
  @browser.close if @browser
  @headless.destroy if @headless
EOS

task_types = [
  { 
    name: 'browsing', 
    setup: browsing_setup, 
    teardown: browsing_teardown
  }
].each {|tt| TaskType.find_or_create_by(tt)}
browsing_type_variables = Variable.find_or_create_by(prompt: 'Select device to emulate', name: '@device_type', validation_type: 'select_list', validation: "iphone, iphone6plus, iphone6, iphone5s, iphone4s, ipad, android_phone, android_tablet", task_type: TaskType.where(name: 'browsing').first)
# params.require(:variable).permit(:prompt, :name, :validation_type, :validation, :task_id, :task_type_id)



# Tasks
# params.require(:task).permit(:name, :description, :code, :variables, :task_type_id)

# # Browsing tasks

browsing_tasks = [
  {
    name: 'go to a url',
    description: 'Given a URL, navigate the current window or tab to it',
    code: '@browser.goto @url',
    task_type: TaskType.where(name: 'browsing').first
  },
  {
    name: 'take a screenshot',
    description: 'Given a URL, navigate the current window or tab to it',
    code: '@screenshot = @browser.screenshot.png',
    task_type: TaskType.where(name: 'browsing').first, 
    return_value: "@screenshot"
  }
].each {|t| Task.find_or_create_by(t) }
# params.require(:variable).permit(:prompt, :name, :validation_type, :validation, :task_id, :task_type_id)
browsing_gotourl_variables = Variable.find_or_create_by(prompt: 'enter a URL to visit', name: '@url', validation_type: 'boolean', validation: "XxVARIABLE_NAMExX =~ URI.regexp", task: Task.where(name: 'go to a url').first)



# Formulas
# params.require(:formula).permit(:name, :description)

formulas = [
  {
    name: "screenshot a single page",
    description: "creates a screenshot for a given URL"
  }
].each {|f| Formula.find_or_create_by(f)}

Formula.where(name: "screenshot a single page").first.tasks << Task.where(name: 'go to a url').first
Formula.where(name: "screenshot a single page").first.tasks << Task.where(name: 'take a screenshot').first




##  :]  ##

