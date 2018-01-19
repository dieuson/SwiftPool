#
# Be sure to run `pod lib lint dvirgile2018.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'dvirgile2018'
  s.version          = '0.1.0'
  s.summary          = 'This is my first pod'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Ce pod permet d'utiliser le framework CoreData pour
apprendre a utiliser la persistance des données et les modeles. Le but de la journée étant
de créer un gestionaire d’articles qui servira d’interface pour le D09.
                       DESC

  s.homepage         = 'https://github.com/dieuson/SwiftPool/tree/master/d08'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dieuson' => 'dieuson.v@gmail.com' }
  s.source           = { :git => 'https://github.com/dieuson/dvirgile2018.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'dvirgile2018/Classes/**/*'
  
  # s.resource_bundles = {
  #   'dvirgile2018' => ['dvirgile2018/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
