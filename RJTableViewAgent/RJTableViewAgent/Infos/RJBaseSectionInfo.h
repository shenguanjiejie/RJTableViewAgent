//
//  RJSectionInfo.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 美约秀. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RJBaseCellInfo.h"

typedef NS_ENUM(NSUInteger, RJSectionType) {
    RJSectionTypeBase,
    RJSectionTypeLabel,
};

@interface RJBaseSectionInfo : NSObject

@property (nonatomic, assign) NSInteger cellTag;

@property (nonatomic, assign) NSIndexPath *indexPath;

@property (nonatomic, assign) RJSectionType sectionType;

@property (nonatomic, strong) UIColor *backgroundColor;

@property (nonatomic, assign, getter=isOpen) BOOL open;

@property (nonatomic, assign) UIEdgeInsets layoutMargins;

@property (nonatomic, assign) CGFloat topMargin;
@property (nonatomic, assign) CGFloat leftMargin;
@property (nonatomic, assign) CGFloat bottomMargin;
@property (nonatomic, assign) CGFloat rightMargin;

@property (nonatomic, strong) NSMutableArray<RJBaseCellInfo *> *cellInfos;

- (instancetype)initWithSectionType:(RJSectionType)sectionType indexPath:(NSIndexPath *)indexPath;
@end
