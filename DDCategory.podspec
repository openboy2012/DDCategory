Pod::Spec.new do |s|
s.name     = 'DDCategory'
s.version  = '0.1'
s.license  = 'MIT'
s.summary  = 'DDKit Private Repository'
s.homepage = 'https://github.com/openboy2012/DDCategory'
s.author   = { 'DeJohn Dong' => 'dongjia_9251@126.com' }
s.source   = { :git => 'https://github.com/openboy2012/DDCategory',:tag=>s.version.to_s}
s.ios.deployment_target = '6.0'
s.public_header_files = 'DDCategroy/Categories/*.h'
s.source_files = 'DDCategroy/Categories/*.{h,m}'
s.requires_arc = true
s.dependency 'SDWebImage','~> 3.7.2'
end
