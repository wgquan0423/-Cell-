//
//  CustomCell.m
//  根据内容自适应Cell高度
//
//  Created by WuGuangQuan on 2020/3/12.
//  Copyright © 2020 quan. All rights reserved.
//

#import "CustomCell.h"

#define  ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define  ScreenHeight [UIScreen mainScreen].bounds.size.height
@implementation CustomCell

- (void)setStrText:(NSString*)strText{
    
    CGFloat height =[CustomCell getStringHeight:strText font:15];
    self.contentLabel.frame = CGRectMake(10,10, ScreenWidth-20, height);
    self.contentLabel.text = strText;

}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createUI];
    }
    return self;
}
-(void)createUI
{
    self.contentLabel =[[UILabel alloc]init];
    self.contentLabel.frame = CGRectMake(10,10, ScreenWidth-20, 50);
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.numberOfLines = NSLineBreakByWordWrapping;
    self.contentLabel.font =[UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.contentLabel];
}
+ (CGFloat)cellHeight:(NSString*)text {

    CGFloat height = [CustomCell getStringHeight:text font:15];
    return height;
}
+ (CGFloat)getStringHeight:(NSString*)string font:(CGFloat)fontSize
{
    CGRect rect =[string boundingRectWithSize:CGSizeMake(ScreenWidth-20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin| NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}  context:nil];
    
    return  ceil(rect.size.height);
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
