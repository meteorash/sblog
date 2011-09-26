# User
Factory.define :user do |user|
  user.email                 "abc@def.com"
  user.password              "xyzxyz"
end

# Post
Factory.define :post do |post|
  post.title                "random title yet again, it only has to be so long"
  post.content              "some random content for the article that is to be published soon on the sblog! website, it has to be really long considering the minimum limit"
end

# Comment
Factory.define :comment do |comment|
  comment.body                "random comment yet again, it only has to be so long"
end