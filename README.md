# RJTableViewAgent
###注意:RJTableViewAgent不太适合非常规律的数据列表页面,不是因为RJTableViewAgent存在瓶颈,而是因为RJTableViewAgent是为了解决UITableView中存在的效率问题而存在的,当在非常规律的数据列表页中,UITableView使用起来并没有什么问题,不需要使用RJTableViewAgent


安装:
iOS 8+

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
