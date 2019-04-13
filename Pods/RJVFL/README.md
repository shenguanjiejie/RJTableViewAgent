# RJVFL

安装:
iOS 8+

```
pod 'RJVFL'
```
如果不使用CocoaPods
将UIView+RJVFL.h和UIView+RJVFL.m加入工程即可

## 1.四周对齐约束
```
/**RJ 2018-12-29 19:29:01 _redView到self.backgroundView的四周边距都为10,该方法等价于下面四行代码*/
[self.backgroundView addAllAlignConstraintToView:_redView constant:10];
/**RJ 2018-12-29 19:30:32 _blueView到_redView的四周边距分别为0,10,100,20*/
[_redView addAllAlignConstraintToView:_blueView edgeInset:UIEdgeInsetsMake(0, 10, 100, 20)];
```
<img src="https://github.com/shenguanjiejie/RJVFL/blob/master/Images/1.png" width="225" height="400.2" alt="图片加载失败"/>

## 2.宽高约束及外部四周约束
```
/**RJ 2018-12-29 19:34:37 _redView和_blueView的宽为100*/
[UIView setWidthConstraintToViews:@[_redView,_blueView] constant:100];
 /**RJ 2018-12-29 20:05:00 _redView高100,_blueView高150*/
[UIView setHeightConstraintToViews:@[_redView,_blueView] constants:@[@100,@150]];

/**RJ 2018-12-29 19:36:07 _redView到self.backgroundView的上方和左方为10*/
[self.backgroundView addTopAlignConstraintToView:_redView constant:10];
[self.backgroundView addLeftAlignConstraintToView:_redView constant:10];

/**RJ 2018-12-29 19:37:32 _redView的底部距离_blueView为10,右边距离_blueView为20*/
[_redView addBottomConstraintToView:_blueView constant:10];
[_redView addRightConstraintToView:_blueView constant:20];
```
<img src="https://github.com/shenguanjiejie/RJVFL/blob/master/Images/2.png" width="225" height="400.2" alt="图片加载失败"/>

## 3.Center相关约束
```
/**RJ 2018-12-29 19:34:37 _redView和_blueView的宽为100,高为200*/
[UIView setWidthConstraintToViews:@[_redView,_blueView] constant:150];
[UIView setHeightConstraintToViews:@[_redView,_blueView] constant:200];

/**RJ 2018-12-29 19:56:59 _redView在self.backgroundView的正中间*/
[self.backgroundView addCenterXYConstraintToView:_redView constantX:0 constantY:0];
/**RJ 2018-12-29 19:58:49 _blueView中心在_redView中心向下10的位置*/
[_redView addCenterXYConstraintToView:_blueView constantX:0 constantY:10];
```
<img src="https://github.com/shenguanjiejie/RJVFL/blob/master/Images/3.png" width="225" height="400.2" alt="图片加载失败"/>


## 4.串约束
```
/**RJ 2018-12-29 20:33:36 仅需两行代码,搞定一串view的所有简单布局*/

/**RJ 2018-12-29 20:30:19
从上到下,同时约束四个view和self.backgroundView,整个串距离全部为10.
这里还用到了RJVFLOptions,RJVFLAlignAllHeight表示这四个view高度相同,不过其实实际开发中很少有这么整齐的约束,所以一般很少会用到RJVFLOptions
*/
[self.backgroundView addBunchConstraintsToViews:@[
_redView,
_blueView,
_yellowView1,
_greenView1
] constant:10 direction:RJDirectionTop options:RJVFLAlignAllHeight];

/**RJ 2018-12-29 20:32:37 水平方向与self.backgroundView对齐*/
[self.backgroundView addHAlignConstraintToViews:@[
_redView,
_blueView,
_yellowView1,
_greenView1
] constant:0];
```
<img src="https://github.com/shenguanjiejie/RJVFL/blob/master/Images/4.png" width="225" height="400.2" alt="图片加载失败"/>

## 5.不规则串约束
```
/**RJ 2018-12-29 20:46:05 与case 3不同的是,这个串中的四个view高度间距都不相同,注意由于constants数组中只有四个constant
依次为 self.backgroundView 10 _redView
_redView 20 _blueView
_blueView 30 _yellowView1
_yellowView 40 _greenView1
所以 greenView1和self.backgroundView的bottom之间没有构建约束,如果constants再多一个NSNumber对象,则会对两者进行约束
假如将RJDirectionTop 改为 RJDirectionBottom,则上方的约束过程为从下往上依次数,最后是_redView 40 _blueView,self.backgroundView的top和_redView之间将没有约束,这也是该方法引入RJDirection参数的原因
*/
[self.backgroundView addBunchConstraintsToViews:@[
_redView,
_blueView,
_yellowView1,
_greenView1
] constants:@[@10,@20,@30,@40] direction:RJDirectionTop];
/**RJ 2018-12-29 20:54:48 分别设置四个view的高度为40,50,100,40 数组中元素一一对应*/
[UIView setHeightConstraintToViews:@[_redView,_blueView,_yellowView1,_greenView1] constants:@[@40,@50,@100,@40]];
[self.backgroundView addHAlignConstraintToViews:@[
_redView,
_blueView,
_yellowView1,
_greenView1
] constant:10];
```
<img src="https://github.com/shenguanjiejie/RJVFL/blob/master/Images/5.png" width="225" height="400.2" alt="图片加载失败"/>

## 6.复杂约束
```
/**RJ 2018-12-29 20:57:21
接下来是稍微复杂一点的约束,其实说是复杂,只是相对于上面的case而言,这些才是我们日常开发中常常遇到的约束场景
*/
/**RJ 2018-12-30 13:23:26
这十一个view的不规则layout,只用了四个方法搞定了.如果能熟练使用这两个串约束方法,能够很快速地实现复杂却更加直观的layout.
如果使用其他layout框架,不知道这些布局需要写多少代码,这也是我坚持封装一个自己想要的layout框架的原因
这里稍作说明:
1.这两个串约束方法,能解决除了宽高外的大部分约束,第一个方法是RJDirectionTop,从上到下,把所有view的上下格局进行约束,第二个方法是RJDirectionLeft,从左到右,把所有view的左右格局进行约束.
2.views及fatherView之间的间隙,和constants中的numbers互相对应,所以如果是要和fatherView的上下都要定义约束,那么constants.count == views.count+1
3.数组中元素支持无限使用数组进行嵌套,之所以需要该功能的原因是,在这些views中,往往多个view和其中一个view之间是相同的constant,可以使用数组将这多个view装进去和这个view组成array和view一对一的关系.不在实际中应用该功能的话很难理解,请结合实际情况进行使用以便熟悉该功能.
4.[NSNull null]是一个占位符,意味着该对应关系处不想添加约束,如果不使用NSNull进行占位,则会导致关系错乱.
5.使用该方法的关键是自行判断如何对views进行分层,结合实际情况,慢慢习惯就好.有一个小技巧是,RJDirectionLeft方法写的时候,可以把设计图横过来看,就转变成了RJDirectionTop一样的逻辑.
*/
[self.backgroundView addBunchConstraintsToViews:@[
_redView,
@[_yellowView1,@[_yellowView2,_yellowView3]],
@[_greenView1,_greenView2],
_blueView,
@[@[_purpleView1,_purpleView2],_purpleView3,_purpleView4]
]
constants:@[
@10,
@[@30,@[@10,@30]],
@[@10], //这里省略了后面的[NSNull null],当数组的后面部分全部为Null时,可以省略不写
@30,
@[@10,@40,@50],
@[[NSNull null],@20,@10],
] direction:RJDirectionTop];

[self.backgroundView addBunchConstraintsToViews:@[
@[_yellowView1,_greenView1,_blueView,_purpleView1],
@[_redView,@[_yellowView2,_greenView2],[NSNull null],_purpleView2],
_yellowView3,
_purpleView3,
_purpleView4
]
constants:@[
@[@10,@30,@10,@30],
@40,
@[@50],//这里省略了后面的两个[NSNull null],
[NSNull null],
@10,
@30,
] direction:RJDirectionLeft];

[UIView setWidthConstraintToViews:@[_redView,_yellowView1,_yellowView2,_yellowView3,_greenView1,_greenView2,_blueView,_purpleView1,_purpleView2,_purpleView3,_purpleView4] constants:@[@100,@80,@80,@60,@100,@100,@280,@60,@40,@80,@60]];
[UIView setHeightConstraintToViews:@[_redView,_yellowView1,_yellowView2,_yellowView3,_greenView1,_greenView2,_blueView,_purpleView1,_purpleView2] constant:30];
```
<img src="https://github.com/shenguanjiejie/RJVFL/blob/master/Images/6.png" width="225" height="400.2" alt="图片加载失败"/>
