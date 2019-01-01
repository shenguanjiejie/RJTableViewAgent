//
//  RJCollectionCellInfo.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 美约秀. All rights reserved.
//

#import "RJCollectionCellInfo.h"
#import "NSObject+RJObject.h"

@implementation RJCollectionCellInfo

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath delegateAndDataSource:(id<UICollectionViewDelegate,UICollectionViewDataSource>)delegate cellClass:(Class)cellClass flowLayout:(UICollectionViewFlowLayout *)flowLayout{
    self = [super initWithCellType:CellTypeCollectionView indexPath:indexPath];
    if (self) {
        self.delegate = delegate;
        self.dataSource = delegate;
        self.collectionCellClass = cellClass?:[UICollectionViewCell class];
        self.collectionCellIdentifier = [cellClass className];
//        _isSelfSizing = NO;
        if (flowLayout) {
            _flowLayout = flowLayout;
        }else{
            _flowLayout= [[UICollectionViewFlowLayout alloc]init];
            _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            //定义行和列之间的间距
            _flowLayout.minimumLineSpacing = 0.0;
            _flowLayout.minimumInteritemSpacing = 0.0;
        }
    }
    
    return self;
}
@end
