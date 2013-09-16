def picture_file(filename = 'large_picture.jpg')
  File.new(Rails.root.join('spec', 'test_pictures', filename))
end
