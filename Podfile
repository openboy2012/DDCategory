inhibit_all_warnings!
source 'https://github.com/CocoaPods/Specs.git'

platform:ios, '7.0'

workspace 'DDCategory'

xcodeproj 'DDCategory'
xcodeproj 'DDCategoryDemo/DDCategoryDemo'

target 'DDCategory' do
    
    pod 'MBProgressHUD', '~> 0.9.1'
    pod 'SDWebImage', '~> 3.7.2'
    
    xcodeproj 'DDCategory'
end

target 'DDCategoryDemo' do
    
    pod 'DDCategory', :path => 'DDCategory.podspec'
    pod 'Aspects', '~> 1.4.1'
    pod 'CocoaLumberjack', '3.1.0'
end
