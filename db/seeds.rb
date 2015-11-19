AboutSection.find_or_create_by(
  video_url: "<iframe width='854' height='480' src='https://www.youtube.com/embed/iXjb1wAfQPo' frameborder='0' allowfullscreen></iframe>",
  content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  mail_to: 'dygt@mail.ru'
)
puts 'AboutSection created'

(blogs_count = 1).times do |i|
  blog = Blog.find_or_initialize_by(
    title: Faker::Lorem.sentences(1).join,
    description: Faker::Lorem.sentences(5).join,
    content: "<p><span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"asdadadsaddadsdadasdadadsaddadsdad\">asdad<span style=\"color:#FF8C00;\">adsaddadsdad</span>asdad<span style=\"color:#FF8C00;\">adsaddadsdad</span></span><span style=\"color:#FF8C00;\"> ad <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"haskdjah\">haskdjah</span> <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"kjas\">kjas</span> hja <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"hdasdkjash\">hdasdkjash</span> <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"dakjsh\">dakjsh</span> <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"dkjashdaksdsad\">dkjashdaksdsad</span> <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"adasd\">adasd</span> as <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"dasd\">dasd</span> <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"dasdas\">dasdas</span> dda <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"dasd\">dasd</span> <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"asdas\">asdas</span> <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"dasdasdkjsahd\">dasdasdkjsahd</span> <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"aksjdhkjas\">aksjdhkjas</span> hda <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"kdjhaskjdh\">kdjhaskjdh</span> <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"askdhkasdjashdkdkhakdaskd\">askdhkasdjashdkdkhakdaskd</span> as <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"dasd\">dasd</span> <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"adas\">adas</span> das das&nbsp;</span>a sad <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"sadasd\">sadasd</span> <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"asdasd\">asdasd</span> <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"asdasd\">asdasd</span> <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"asdasd\">asdasd</span> as</p>\r\n\r\n<p>dasd&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/blog/pictures/2/content_4.png\" style=\"width: 640px; height: 960px;\" />asd</p>\r\n\r\n<p>&nbsp;asd asd as <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"dnaskdashdkahs\">dnaskdashdkahs</span> <span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"djasd\">djasd</span> asdasdasdasdasda</p>\r\n\r\n<p>asdas</p>\r\n\r\n<p>dsa</p>\r\n\r\n<p><span class=\"scayt-misspell-word\" data-scayt-lang=\"en_US\" data-scayt-word=\"dadas\">dadas</span></p>\r\n\r\n<p>das</p>\r\n\r\n<p>das</p>\r\n\r\n<p>dasda</p>\r\n\r\n<p>&nbsp;</p>\r\n"
  )
  blog.image = URI.parse('http://lorempixel.com/600/400/')
  blog.save
  puts "Blog##{i} out of #{blogs_count} created"
end

%w(Bags Backpacks Pencil\ cases Sketchbooks Notebooks).each do |category|
  ProductCategory.find_or_create_by(title: category)
  puts "ProductCategory - #{category} created"
end

ProductCategory.find_each do |category|
  rand(1..10).times do
    product = category.products.new(
      title: "Product#{1}",
      price: rand(10.00..999.60).round(2),
      description: "Lorem ipsum dolor sit amet"
    )
    product.images.build(img: File.new('/Users/gataniel/projects/lovelyandhandy/temp.jpg'))
    product.save!
  end
end
