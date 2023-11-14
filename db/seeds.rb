# frozen_string_literal: true

["Books", "Films", "Games", "Animals"].each do |title|
  Category.find_or_create_by!(title: title)
end

p "created categories"
