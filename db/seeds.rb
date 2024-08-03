# frozen_string_literal: true

middle_kid_memes_blog = Blog.new(name: 'Middle Kid Memes')
middle_kid_memes_blog.save!

creator = User.new(first_name: 'Zack', last_name: 'Walkingstick', email: 'zackwalkingstick@gmail.com')
creator.save!

first_entry = Entry.new(title: 'Middle Kid Trait #1', content: 'How is it that as soon as you become a middle child you can automatically walk barefoot on sharp rocks!')
first_entry.creator = creator
first_entry.blog = middle_kid_memes_blog
first_entry.save

comment_creator = User.new(first_name: 'Jonny', last_name: 'Appleseed', email: 'zackwalkingstick@gmail.com')
comment_creator.save!

first_comment = Comment.new(title: 'WTF is this', description: 'I know middle kids can be quirky but a whole blog about it?!')
first_comment.creator = comment_creator
first_comment.entry = first_entry
first_comment.save!
