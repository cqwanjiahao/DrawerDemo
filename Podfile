source 'https://github.com/smartydroid/Specs.git'
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.0'
use_frameworks!

inhibit_all_warnings!

target 'DrawerDemo' do
  pod 'Masonry'
  pod 'MMDrawerController', '~> 0.5.7'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
            config.build_settings['ARCHS'] = 'armv7 armv7s arm64'
            config.build_settings['VALID_ARCHS'] = 'armv6 armv7 armv7s arm64'
            config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
        end
    end
end
