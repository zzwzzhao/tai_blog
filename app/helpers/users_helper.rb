# -*- encoding : utf-8 -*-
module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def gravatar_for_admin(options = { size: 40 })
    user = User.find_by_name('admin')
    gravatar_for(user, size: options[:size])
  end
end
