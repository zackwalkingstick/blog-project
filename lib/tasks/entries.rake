# frozen_string_literal: true

namespace :entries do
  desc 'Add new entry'
  task add: :environment do
    options = {}
    print 'Enter the title of your blog entry: '
    options[:title] = STDIN.noecho(&:gets).strip
    print "\nTitle: #{options[:title]}\n"

    print 'Enter the content text block of your blog entry: '
    options[:content] = STDIN.noecho(&:gets).strip
    print "\nContent: #{options[:content]}\n"

    blog = Blog.where(name: 'Middle Kid Memes').first
    creator = User.first_or_create!(first_name: 'Zack', last_name: 'Walkingstick', email: 'zackwalkingstick@gmail.com')

    entry = Entry.new(title: options[:title], content: {"text": options[:content]}, blog: blog, creator: creator)
    entry.save!
  end
end
