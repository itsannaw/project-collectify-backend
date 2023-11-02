# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:5173'
    resource '*', headers: :any, methods: %i[get post put patch delete options head]
  end

  allow do
    origins "https://project-collectify.vercel.app"
    resource "*",
      headers: :any,
      methods: :any, #[:get, :post, :put, :patch, :delete, :options, :head]
      expose: [:Authorization]
  end
end
