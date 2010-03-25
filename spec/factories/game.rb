Factory.define :game do |g|
  g.name { Forgery(:name).company_name }
  g.slug {|g| g.name.downcase.dasherize }
end
