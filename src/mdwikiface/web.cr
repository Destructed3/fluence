private def verify_request(env)
end

error 404 do
  "Page not found"
end

error 403 do
  "Forbidden"
end
