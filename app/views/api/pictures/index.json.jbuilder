json.array! @pictures do |picture|
  json.content picture.content
  json.image picture.image.url
  json.nickname picture.user.nickname
end

  
  