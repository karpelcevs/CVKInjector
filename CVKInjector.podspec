Pod::Spec.new do |s|
  s.name             = "CVKInjector"
  s.version          = "0.1.0"
  s.summary          = "Trivial dependency injector for Objective-C."
  s.homepage         = "https://github.com/coverback/CVKInjector"
  s.license          = 'MIT'
  s.author           = { "Romans Karpelcevs" => "karpelcev@gmail.com" }
  s.source           = { :git => "https://github.com/coverback/CVKInjector.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/cvbk'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.public_header_files = 'Pod/Classes/CVKInjector.h'
end
