Pod::Spec.new do |s|

s.name         = "RJTableViewAgent"
s.version      = "1.0.0"
s.summary      = "将常用的一些Cell封装了到了RJTableViewAgent中,使得使用UITableView的时候可以快速开发"
s.homepage     = "https://github.com/shenguanjiejie/RJTableViewAgent"
s.license = { :type => 'MIT'}
s.author             = { "shenguanjiejie" => "835166018@qq.com" }
s.social_media_url   = "https://github.com/shenguanjiejie"
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/shenguanjiejie/RJTableViewAgent.git", :tag => s.version }

s.default_subspec = 'All'

s.subspec 'All' do |spec|
s.requires_arc = true
s.source_files  = "RJTableViewAgent/RJTableViewAgent/*.{h,m}"
spec.dependency 'RJTableViewAgent/Resource'
spec.dependency 'RJTableViewAgent/Cells'
spec.dependency 'RJTableViewAgent/Infos'
end

s.subspec 'Resource' do |spec|
spec.requires_arc = false
spec.source_files  = "RJTableViewAgent/RJTableViewAgent/Resource/*.png"
end

s.subspec 'Cells' do |spec|
spec.requires_arc = true
spec.source_files  = "RJTableViewAgent/RJTableViewAgent/Cells/*.{h,m}"
end

s.subspec 'Infos' do |spec|
spec.requires_arc = true
spec.source_files  = "RJTableViewAgent/RJTableViewAgent/Infos/*.{h,m}"
end

s.dependency "SDWebImage"
s.dependency "RJVFL"
s.dependency "YYText"
s.dependency "TYCyclePagerView"
s.dependency "DZNEmptyDataSet"
s.dependency 'UITextView+Placeholder', :podspec =>'https://raw.githubusercontent.com/shenguanjiejie/UITextView-Placeholder/master/UITextView%2BPlaceholder.podspec'
s.dependency "YBImageBrowser"
s.dependency "IQKeyboardManager"
s.dependency "MBProgressHUD"

end
