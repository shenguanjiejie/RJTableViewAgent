//
//  RJBaseCellInfo.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJBaseCellInfo.h"
#import "NSObject+RJObject.h"

@interface RJBaseCellInfo()
@property (nonatomic, strong) NSMutableString *mutableBindingString;
@end

@implementation RJBaseCellInfo

- (instancetype)initWithCellType:(CellType)cellType indexPath:(NSIndexPath *)indexPath
{
    self = [super init];
    if (self) {
        _identifier = [self className];
        _hidden = NO;
        _lineHidden = YES;
        _cellType = cellType;
        _indexPath = indexPath;
        _cellHeight = NSNotFound;
        self.layoutMargins = UIEdgeInsetsMake(10, 15, 10, 15);
        _topMargin = 0;
        _leftMargin = 15;
        _bottomMargin = 0;
        _rightMargin = 15;
        _lineHeight = 0.5;
        _lineColor = [RJTableViewAgentConfig sharedConfig].separateColor;
        _backgroundColor = [UIColor clearColor];
        _bindingStringMinLength = 0;
        _bindingStringMaxLength = NSNotFound;
        _cellVariety = RJCellVarietyAll;
        [self addBindingStringObserver];
        self.mutableBindingString = [NSMutableString string];
        self.bindingString = self.mutableBindingString;
    }
    return self;
}

- (void)setLayoutMargins:(UIEdgeInsets)layoutMargins __attribute__((objc_requires_super)){
    _layoutMargins = layoutMargins;
    self.lineLeftMargin = layoutMargins.left;
    self.lineRightMargin = layoutMargins.right;
    _topMargin = layoutMargins.top;
    _leftMargin = layoutMargins.left;
    _bottomMargin = layoutMargins.bottom;
    _rightMargin = layoutMargins.right;
}

- (void)setTopMargin:(CGFloat)topMargin{
    _topMargin = topMargin;
    _layoutMargins = UIEdgeInsetsMake(topMargin, _layoutMargins.left, _layoutMargins.bottom, _layoutMargins.right);
}

- (void)setLeftMargin:(CGFloat)leftMargin{
    _leftMargin = leftMargin;
    _layoutMargins = UIEdgeInsetsMake(_layoutMargins.top, leftMargin, _layoutMargins.bottom, _layoutMargins.right);
}

- (void)setBottomMargin:(CGFloat)bottomMargin{
    _bottomMargin = bottomMargin;
    _layoutMargins = UIEdgeInsetsMake(_layoutMargins.top, _layoutMargins.left, bottomMargin, _layoutMargins.right);
}

- (void)setRightMargin:(CGFloat)rightMargin{
    _rightMargin = rightMargin;
    _layoutMargins = UIEdgeInsetsMake(_layoutMargins.top, _layoutMargins.left, _layoutMargins.bottom, rightMargin);
}

//- (void)setBindingStringValidatePrefix:(NSString *)bindingStringValidatePrefix{
//    _bindingStringValidatePrefix = bindingStringValidatePrefix;
//    [self removeRJCellObserver];
//}

- (void)addBindingStringObserver{
    if (_bindingStringKVOPropertyName) {
        [self addObserver:self forKeyPath:_bindingStringKVOPropertyName options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)setBindingString:(NSString *)bindingString{
    [self changeBindingStringWithString:bindingString];
}

- (void)changeBindingStringWithString:(NSString *)string{
    /** [self.mutableBindingString setString:text];这句话,如果text为nil,会有将近1s的延迟,为了解决这个奇怪的问题,这里做了调整,判断text为nil的情况,做出相应的调整*/
    if (string && [string isKindOfClass:[NSString class]]) {
        if ([_mutableBindingString isEqualToString:string]) {
            return;
        }
        
//        if (!_mutableBindingString) {
//            _mutableBindingString = [NSMutableString string];
//        }
        [_mutableBindingString setString:(NSString *)string];
    }else{
//        _mutableBindingString = nil;
        [_mutableBindingString setString:@""];
    }
}

- (NSString *)bindingString{
    return self.mutableBindingString;
}

//- (void)setBindingString:(NSString *__strong *)bindingString{
//    _bindingString = bindingString;
//    /** 因为该参数一般用于网络请求参数的构建,如果没有初始化,就初始化,防止为nil时,导致作为字典的value的时候崩溃*/
//    if (![*bindingString length]) {
//        *_bindingString = [NSString string];
//    }
//}

- (void)dealloc{
    [self removeRJCellObserver];
}

- (void)removeRJCellObserver{
    if (_bindingStringKVOPropertyName.length) {
        @try {
            @autoreleasepool {
                [self removeObserver:self forKeyPath:_bindingStringKVOPropertyName context:nil];
            }
        }@catch (NSException* exception){
            NSLog(@"!!!😱😱😱😱😱😱😱😱捕获到了异常!!!:Exception=%@\nStack Trace:%@,reason:%@,name:%@", exception, [exception callStackSymbols],[exception reason],[exception name]);
        }@finally{
            _bindingStringKVOPropertyName = nil;
        }
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:_bindingStringKVOPropertyName]) {
        id text = [change objectForKey:NSKeyValueChangeNewKey];
        [self changeBindingStringWithString:text];
//        *_bindingString = text;
    }
}

@end
