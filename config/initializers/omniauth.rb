Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, ENV['vxnDclZmfcDwyAIEnjcSwboAL'], ENV['q3Q7CrAuJRwDrvsU4OmtOBlejolvFPebKn9jBGWcm05hhrf2NI']
end
