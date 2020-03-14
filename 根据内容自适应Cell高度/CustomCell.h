//
//  CustomCell.h
//  根据内容自适应Cell高度
//
//  Created by WuGuangQuan on 2020/3/12.
//  Copyright © 2020 quan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomCell : UITableViewCell
@property(nonatomic,strong) UILabel * contentLabel;
@property(nonatomic,strong) NSString * strText;
+ (CGFloat)cellHeight:(NSString*)text;
@end

NS_ASSUME_NONNULL_END
