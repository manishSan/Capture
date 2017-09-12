#
# Be sure to run `pod lib lint Capture.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LogCapture'
  s.version          = '0.1.3'
  s.summary          = 'A small utility library to capture logs in project.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A small utility library to capture logs in project, also include a small table UI to show those logs.
                       DESC

  s.platform = :ios, '9.0'
  # s.ios.deployment_target = "9.0"
  # s.osx.deployment_target = "10.10"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.homepage         = 'https://github.com/manishb24/Capture'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'manishb24' => 'Manish.Sanwal@gmail.com' }
  s.source           = { :git => 'https://github.com/manishb24/Capture.git', :tag => s.version.to_s }
  #s.source           = { :git => "https://github.com/manishb24/Capture.git", :commit => "3db1fcc725823c456404b9d260d028e7479e7b3c" }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Capture/**/*'

  # s.resource_bundles = {
  #   'Capture' => ['Capture/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.requires_arc = true
  s.framework  = 'Foundation', 'UIKit'
  s.dependency "RxSwift", "~> 3.6.1"
  s.dependency "RxCocoa", "~> 3.6.1"
  s.dependency "RxRealm", "~> 0.6.0"
end
