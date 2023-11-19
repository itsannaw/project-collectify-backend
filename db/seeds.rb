# frozen_string_literal: true

%w[Books Films Games Animals].each do |title|
  Category.find_or_create_by!(title:)
end
