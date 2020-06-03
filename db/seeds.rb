# frozen_string_literal: true

puts ">> Creating users..."

User.find_or_create_by!(email: "admin@admin.com") do |user|
  user.username = "Admin"
  user.password = "1qaz@wsx"
  user.password_confirmation = "1qaz@wsx"
end

# ------------------------------------------------------------------------------

puts ">> Creating lines..."

%w[Nestlé Food Garoto Purina].each do |line_description|
  Line.find_or_create_by!(line_description: line_description)
end

# ------------------------------------------------------------------------------

# puts ">> Creating groups..."

# group_mapping = {
#   "Nestlé" => ["Produto Nestlé"],
#   "Food" => ["Produto Food"]
# }

# group_mapping.each.with_index(1) do |(line_description, group_descriptions), index|
#   group_descriptions.each do |group_description|
#     Group.find_or_create_by!(group_code: index) do |group|
#       group.line = Line.find_by(line_description: line_description)
#       group.group_description = group_description
#     end
#   end
# end

# # ------------------------------------------------------------------------------

# puts ">> Creating families..."

# Group.all.each.with_index(1) do |group, index|
#   Family.find_or_create_by!(family_code: index) do |family|
#     family.group = group
#     family.family_description = group.group_description.gsub(/Produto/, "Família")
#   end
# end

# # ------------------------------------------------------------------------------

# puts ">> Creating tax classifications..."

# tax_classification = TaxClassification.find_or_create_by!(tax_code: "12.214.201.00")

# # ------------------------------------------------------------------------------

# puts ">> Creating products..."

# Family.all.each.with_index(1) do |family, index|
#   Product.find_or_create_by!(product_code: index) do |product|
#     product.group = family.group
#     product.family = family
#     product.tax_classification = tax_classification
#     product.product_description = family.group.group_description
#     product.product_ean = index
#     product.product_dun = index
#     product.status = true
#     product.releases = true
#   end
# end
