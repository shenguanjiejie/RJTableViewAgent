//
//  RJCollectionCell.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 美约秀. All rights reserved.
//

#import "RJCollectionCell.h"

@interface RJCollectionCell()

@end

@implementation RJCollectionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    _flowLayout= [[UICollectionViewFlowLayout alloc]init];
    _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //定义行和列之间的间距
    _flowLayout.minimumLineSpacing = 0.0;
    _flowLayout.minimumInteritemSpacing = 0.0;
    
    return [self initWithStyle:style reuseIdentifier:reuseIdentifier flowLayout:_flowLayout];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier flowLayout:(UICollectionViewFlowLayout *)flowLayout{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.flowLayout = flowLayout;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
        _collectionView.pagingEnabled = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        [self.contentView addSubview:_collectionView];
        
        //        [_collectionView setMarginsConstraintWithEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
//        self.collectionView.frame = CGRectMake(0, 0, kRJScreenWidth, kScreenHeight);
        [self.contentView addAllAlignConstraintToView:self.collectionView constant:0];
//        [self.contentView addHAlignConstraintToView:self.collectionView constant:15];
//        [self.collectionView addVAlignConstraintToView:self.collectionView constant:0];
        [self.collectionView addHeightConstraintWithConstant:0].active = NO;
        
    }
    return self;
}

@end
