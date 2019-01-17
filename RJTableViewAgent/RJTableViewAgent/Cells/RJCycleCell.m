//
//  RJCycleCell.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenruijie. All rights reserved.
//

#import "RJImageCCell.h"
#import "RJCycleCell.h"
#import "YBImageBrowser.h"
#import "NSObject+RJObject.h"
#import "UIImageView+WebCache.h"
#import "RJTableViewAgentConfig.h"

@interface RJCycleCell()<TYCyclePagerViewDelegate,TYCyclePagerViewDataSource,YBImageBrowserDelegate,YBImageBrowserDataSource>

@end

@implementation RJCycleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _cyclePagerView = [[TYCyclePagerView alloc] init];
        _cyclePagerView.isInfiniteLoop = YES;
        _cyclePagerView.delegate = self;
        _cyclePagerView.dataSource = self;
        _cyclePagerView.autoScrollInterval = 4.0;
        [_cyclePagerView registerClass:[RJImageCCell class] forCellWithReuseIdentifier:@"RJImageCCell"];
        [self.contentView addSubview:_cyclePagerView];
        [_cyclePagerView addMarginsConstraintWithEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
    return self;
}

- (void)setCycleImages:(NSArray<RJImage *> *)cycleImages{
    _cycleImages = cycleImages;
    [_cyclePagerView reloadData];
}

-(NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView{
    return self.cycleImages.count;
}

-(TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView{
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc]init];
    layout.itemSize = self.cycleImageSize;
    layout.itemSpacing = self.cycleInterval;
    layout.itemHorizontalCenter = YES;
    layout.itemVerticalCenter = YES;
//    layout.maximumAngle = 10;
    layout.layoutType = self.cycleType;
    return layout;
}

-(UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index{
    RJImageCCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:[RJImageCCell className] forIndex:index];
    RJImage *image = [self.cycleImages objectAtIndex:index];
    if (image.image) {
        cell.imageView.image = image.image;
    }else if (image.url){
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:image.url] placeholderImage:self.placeholderImage];
    }else if (image.key){
#ifdef Meiyue
        [cell.imageView rj_setImageWithKey:image.key];
#endif
    }
    return cell;
}


-(void)pagerView:(TYCyclePagerView *)pageView didSelectedItemCell:(__kindof UICollectionViewCell *)cell atIndex:(NSInteger)index{
    YBImageBrowser *browser = [[YBImageBrowser alloc] init];
    
    browser.delegate = self;
    browser.dataSource = self;
    [browser show];
}

-(void)pagerView:(TYCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex{
}


#pragma mark - YBImageBrowserDataSource

- (NSUInteger)yb_numberOfCellForImageBrowserView:(YBImageBrowserView *)imageBrowserView{
    return self.cycleImages.count;
}

- (id<YBImageBrowserCellDataProtocol>)yb_imageBrowserView:(YBImageBrowserView *)imageBrowserView dataForCellAtIndex:(NSUInteger)index{
    YBVideoBrowseCellData *data = [YBVideoBrowseCellData new];
    RJImage *image = self.cycleImages[index];
    if (image.image) {
        data.firstFrame = image.image;
    }else if (image.url){
        data.url = [NSURL URLWithString:image.url];
    }
    return data;
}

@end
