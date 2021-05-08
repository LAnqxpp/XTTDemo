//
//  XBKCellFactory.m
//  XTTDemo
//
//  Created by w on 2021/5/7.
//  Copyright © 2021 xtt. All rights reserved.
//

#import "XBKCellFactory.h"

@implementation XBKCellFactory

+ (XBTHBaseTableViewCell *)cellWithTableView:(UITableView *)tableView Model:(id)model IndexPath:(NSIndexPath *)indexPath
{
  return [self cellWithTableView:tableView Model:model IndexPath:indexPath Type:[self cellTypeWithModel:model]];
}

+(CGFloat)cellHightWithModel:(id)model{
    return [self cellHightWithModel:model Type:[self cellTypeWithModel:model]];
}

+(CellType)cellTypeWithModel:(id)model{
    
    XBKBaseModel *newsModel = (XBKBaseModel*)model;
    NSInteger index = 0 ;
    switch ([newsModel.type integerValue]) {
        case 1:
            index = PreferentialCell;
            break;
        case 2:
            index = SyncClassCell;
            break;
        case 3:
            index = TimeLimitCell;
            break;
        case 4:
            index = FamousTeacherCell;
            break;
            
        default:
            break;
    }
    return index;
}


+ (XBTHBaseTableViewCell *)cellWithTableView:(UITableView *)tableView Model:(id)model IndexPath:(NSIndexPath *)indexPath Type:(CellType)type{
    
    XBTHBaseTableViewCell *result = nil;
    switch (type) {
        case PreferentialCell:
            result = [tableView dequeueReusableCellWithIdentifier:@"PreferentialTableViewCellId" forIndexPath:indexPath];
            break;
        case SyncClassCell:
              result = [tableView dequeueReusableCellWithIdentifier:@"SyncClassTableViewCellId" forIndexPath:indexPath];
            break;
        case TimeLimitCell:
               result = [tableView dequeueReusableCellWithIdentifier:@"TimeLimitTableViewCellId" forIndexPath:indexPath];
            
            break;
        case FamousTeacherCell:
          
            result = [tableView dequeueReusableCellWithIdentifier:@"FamousTeacherTableViewCellId" forIndexPath:indexPath];
            break;
        default:
            break;
    }
    
    [result getDataWithModel:model];
    return result;
    
}

+(CGFloat)cellHightWithModel:(id)model Type:(CellType)type{
    
    switch (type) {
        case PreferentialCell:
            return 122;
            break;
        case SyncClassCell:
            return 185;
            break;
        case TimeLimitCell:
            return 122;
            break;
        case FamousTeacherCell:
            return 139;
            break;
        default:
            break;
    }
 
}


@end
