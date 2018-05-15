source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.0'

use_frameworks!
inhibit_all_warnings!

target 'Beer Lovers' do
    pod 'GooglePlaces'
    
    target 'Beer LoversTests' do
        inherit! :complete
    end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '4.1'
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
    end
  end
end
