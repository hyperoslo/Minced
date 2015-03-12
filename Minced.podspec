Pod::Spec.new do |s|
  s.name             = "Minced"
  s.version          = "0.1"
  s.summary          = "ObjectiveC-fy your JSON keys. Enables camelCase named model attributes when performing direct JSON to object mapping."
  s.homepage         = "https://github.com/hyperoslo/Minced"
  s.license          = 'MIT'
  s.author           = { "Hyper AS" => "teknologi@hyper.no" }
  s.source           = { :git => "https://github.com/hyperoslo/Minced.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/hyperoslo'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Source/**/*'

  s.dependency 'NSString-HYPNetworking', '~> 0.1'
end
