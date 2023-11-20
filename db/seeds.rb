# frozen_string_literal: true

%w[Books Films Games Animals Other].each do |title|
  Category.find_or_create_by!(title:)
end
