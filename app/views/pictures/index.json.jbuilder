json.array! @pictures do |picture|
  json.text picture.content
  json.image picture.image.url
  json.nickname picture.user.nickname
  json.id picture.id
end