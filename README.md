# RJTableViewAgent
将常用的一些Cell封装了到了RJTableViewAgent中,使得使用UITableView的时候可以快速开发


安装:
iOS 8+

## warning:Cocoapods生成失败,目前不可用
```
pod 'RJTableViewAgent'//完整版
完整版依赖第三方框架
'RJVFL'
'SDWebImage'
'YYText'
'TYCyclePagerView'
'DZNEmptyDataSet'
'UITextView+Placeholder', :podspec =>'https://raw.githubusercontent.com/shenguanjiejie/UITextView-Placeholder/master/UITextView%2BPlaceholder.podspec'
'YBImageBrowser'
'IQKeyboardManager'
'MBProgressHUD'

//轻量版,目前还没有该版本 pod 'RJTableViewAgent_Lite' 

```

### 下方两张截图为Demo的实现效果,16个不同样式的可控(可控意思是cell中所有控件位置可动态调整)cell,包括输入限制和验证,200行代码搞定.
Demo主要为了演示使用方法,没有做美化.

<img src="https://github.com/shenguanjiejie/RJTableViewAgent/blob/master/Images/1.png" width="562.5" height="1218" alt="图片加载失败"/>
<img src="https://github.com/shenguanjiejie/RJTableViewAgent/blob/master/Images/2.png" width="562.5" height="1218" alt="图片加载失败"/>
