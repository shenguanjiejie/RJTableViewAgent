Pod::Spec.new do |s|

s.name         = "RJTableViewAgent"
s.version      = "1.0.8.1"
s.summary      = "将常用的一些Cell封装了到了RJTableViewAgent中,使得使用UITableView的时候可以快速开发,尤其是表单页面,可节省大量时间."
s.homepage     = "https://github.com/shenguanjiejie/RJTableViewAgent"
s.license = { :type => 'MIT'}
s.author             = { "shenguanjiejie" => "835166018@qq.com" }
s.social_media_url   = "https://github.com/shenguanjiejie"
s.platform     = :ios, "9.0"
s.source       = { :git => "https://github.com/shenguanjiejie/RJTableViewAgent.git", :tag => s.version }
s.source_files  = "RJTableViewAgent/RJTableViewAgent/*.{h,m}"
s.requires_arc = true
s.user_target_xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }

#s.dependency 'UITextView+Placeholder'
s.dependency 'SDWebImage'
s.dependency 'RJVFL'
s.dependency 'YYText'
s.dependency 'TYCyclePagerView'
s.dependency 'DZNEmptyDataSet'
s.dependency 'YBImageBrowser'
s.dependency 'IQKeyboardManager'
s.dependency 'MBProgressHUD'

s.subspec 'Resource' do |ss|
ss.requires_arc = false
#ss.source_files  = "RJTableViewAgent/RJTableViewAgent/Resource/*.png"
ss.resources = "RJTableViewAgent/RJTableViewAgent/Resource/RJTableViewAgent.bundle"
end

s.subspec 'Utils' do |ss|
ss.requires_arc = true
ss.source_files  = "RJTableViewAgent/RJTableViewAgent/Utils/*.{h,m}"
end

s.subspec 'Infos' do |ss|
ss.requires_arc = true
ss.source_files  = "RJTableViewAgent/RJTableViewAgent/Infos/*.{h,m}"
ss.dependency 'RJTableViewAgent/Utils'
end

s.subspec 'Cells' do |ss|
ss.requires_arc = true
ss.source_files  = "RJTableViewAgent/RJTableViewAgent/Cells/*.{h,m}"
ss.dependency 'RJTableViewAgent/Infos'
ss.dependency 'RJTableViewAgent/Utils'
end

end
