//
//  RJCollectionCell.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 diling. All rights reserved.
//

#import "RJBaseCell.h"

@interface RJCollectionCell : RJBaseCell

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier flowLayout:(UICollectionViewFlowLayout *)flowLayout;

@end
