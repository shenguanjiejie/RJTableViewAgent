Pod::Spec.new do |s|

s.name         = "RJTableViewAgent"
s.version      = "1.0.4"
s.summary      = "将常用的一些Cell封装了到了RJTableViewAgent中,使得使用UITableView的时候可以快速开发"
s.homepage     = "https://github.com/shenguanjiejie/RJTableViewAgent"
s.license = { :type => 'MIT'}
s.author             = { "shenguanjiejie" => "835166018@qq.com" }
s.social_media_url   = "https://github.com/shenguanjiejie"
s.platform     = :ios, "9.0"
s.source       = { :git => "https://github.com/shenguanjiejie/RJTableViewAgent.git", :tag => s.version }

s.dependency 'SDWebImage'
s.dependency 'RJVFL'
s.dependency 'YYText'
s.dependency 'TYCyclePagerView'
s.dependency 'DZNEmptyDataSet'
s.dependency 'YBImageBrowser'
s.dependency 'IQKeyboardManager'
s.dependency 'MBProgressHUD'

s.source_files  = "RJTableViewAgent/RJTableViewAgent/**/*"
s.requires_arc = true
s.user_target_xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }

#s.dependency 'UITextView+Placeholder'

#s.subspec 'Resource' do |ss|
#ss.requires_arc = false
#ss.source_files  = "RJTableViewAgent/RJTableViewAgent/Resource/*.png"
#end
#
#s.subspec 'Cells' do |spec|
#ss.requires_arc = true
#ss.source_files  = "RJTableViewAgent/RJTableViewAgent/Cells/*.{h,m}"
#end
#
#s.subspec 'Infos' do |spec|
#ss.requires_arc = true
#ss.source_files  = "RJTableViewAgent/RJTableViewAgent/Infos/*.{h,m}"
#end

end
