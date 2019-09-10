//
//  RJCollectionCellInfo.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 diling. All rights reserved.
//

#import "RJBaseCellInfo.h"

@interface RJCollectionCellInfo : RJBaseCellInfo

//@property (nonatomic, strong) UICollectionView *collectionView;

/** 只有在该cell将要显示到屏幕中之后才能取到该collectionView*/
@property (nonatomic, strong) UICollectionView *collectionView;

/** default:[UICollectionViewCell class]*/
@property (nonatomic, assign) Class collectionCellClass;

/**RJ 2019-01-01 21:42:15
 default:cellClass的className
 */
@property (nonatomic, copy) NSString *collectionCellIdentifier;

//@property (nonatomic, assign) BOOL isSelfSizing;

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, weak, nullable) id <UICollectionViewDelegate> delegate;
@property (nonatomic, weak, nullable) id <UICollectionViewDataSource> dataSource;

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath delegateAndDataSource:(id<UICollectionViewDelegate,UICollectionViewDataSource>)delegate cellClass:(Class)cellClass flowLayout:(UICollectionViewFlowLayout *)flowLayout;

@end
