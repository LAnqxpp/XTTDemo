//
//  XBKCellFactory.h
//  XTTDemo
//
//  Created by w on 2021/5/7.
//  Copyright © 2021 xtt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XBKBaseModel.h"
#import "XBTHBaseTableViewCell.h"
#import "SyncClassTableViewCell.h"
#import "TimeLimitTableViewCell.h"
#import "FamousTeacherTableViewCell.h"
#import "PreferentialTableViewCell.h"


NS_ASSUME_NONNULL_BEGIN

@interface XBKCellFactory : NSObject

typedef NS_ENUM(NSUInteger, CellType){
    
    PreferentialCell = 1,
    SyncClassCell,
    TimeLimitCell,
    FamousTeacherCell,
};


+(CellType)cellTypeWithModel:(id)model;

+(XBTHBaseTableViewCell*)cellWithTableView:(UITableView*)tableView Model:(id)model IndexPath:(NSIndexPath*)indexPath;

+(XBTHBaseTableViewCell*)cellWithTableView:(UITableView*)tableView Model:(id)model IndexPath:(NSIndexPath*)indexPath Type:(CellType)type;

+(CGFloat)cellHightWithModel:(id)model;

+(CGFloat)cellHightWithModel:(id)model Type:(CellType)type;

@end

NS_ASSUME_NONNULL_END
