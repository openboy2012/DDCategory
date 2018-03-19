inhibit_all_warnings!
source 'https://github.com/CocoaPods/Specs.git'
#source 'https://github.com/CocoaPods/Old-Specs'

platform:ios, '7.0'

workspace 'DDCategory'

xcodeproj 'DDCategory'
xcodeproj 'DDCategoryDemo/DDCategoryDemo'

target 'DDCategory' do
    
    pod 'MBProgressHUD', '0.9.2'
    pod 'SDWebImage', '3.7.4'
    
    xcodeproj 'DDCategory'
end

target 'DDCategoryDemo' do
    
    pod 'DDCategory', :path => 'DDCategory.podspec'
    pod 'Aspects', '~> 1.4.1'
    pod 'MJRefresh', '3.1.12'
    pod 'Masonry', '1.0.2'
    pod 'KVOController', '1.2.0'
    pod 'DDCollectionViewFlowLayout', '1.0'
end
