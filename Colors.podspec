Pod::Spec.new do |s|
  s.name         = "Colors"
  s.version      = "1.0"
  s.summary      = "A color library for Swift."
  s.description  = <<-DESC
    A color library for Swift.
  DESC
  s.homepage     = "https://github.com/dylan/Colors"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Dylan Wreggelsworth" => "dylan@bvr.io" }
  s.social_media_url   = "http://twitter.com/dylanrw"
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/dylan/Colors.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
