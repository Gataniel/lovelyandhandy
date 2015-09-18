AboutSection.find_or_create_by(
  video_url: "<iframe width='854' height='480' src='https://www.youtube.com/embed/iXjb1wAfQPo' frameborder='0' allowfullscreen></iframe>",
  content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  mail_to: 'dygt@mail.ru'
)

100.times do
  blog = Blog.find_or_initialize_by(
    title: Faker::Lorem.sentences(1).join,
    description: Faker::Lorem.sentences(5).join,
    content: Blog.first.content
  )
  blog.image = URI.parse('http://lorempixel.com/600/400/')
  blog.save
end
