Pod::Spec.new do |s|
  s.name = 'Trilean'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'Three-valued logic for Swift'
  s.homepage = 'https://github.com/phelgo/Trilean'
  s.social_media_url = 'http://twitter.com/phelgo'
  s.authors = { 'phelgo' => 'phelgo@gmail.com' }
  s.source = { :git => 'https://github.com/phelgo/Trilean.git', :tag => s.version }
  s.source_files = 'Trilean/*.swift'
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.requires_arc = true
end
