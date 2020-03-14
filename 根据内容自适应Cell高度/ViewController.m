//
//  ViewController.m
//  根据内容自适应Cell高度
//
//  Created by WuGuangQuan on 2020/3/12.
//  Copyright © 2020 quan. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#define  ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define  ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * pTableView;
@property(nonatomic,strong) NSArray * dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor  whiteColor];
    
    self.dataArray =@[@"东湖碧波，樱花绽放。",@"东湖碧波，樱花绽放。10日下午，实地考察结束后，习近平总书记走进会场",@"东湖碧波，樱花绽放。10日下午，实地考察结束后，习近平总书记走进会场。他的讲话通过屏幕，同步向湖北省13个市州和4个省直辖县级行政单位直播",@"窗外，昔日喧闹的城市，40多天前按下了暂停键。武汉正在经历一场磨难，却并非独自战斗，武汉和湖北的背后站着整个中国，窗外，昔日喧闹的城市，40多天前按下了暂停键。武汉正在经历一场磨难，却并非独自战斗，武汉和湖北的背后站着整个中国",@"中央和国家机关各部委要继续加大对湖北的支持力度，制定一揽子计划，在就业、财政、税收、金融、脱贫攻坚、重大项目建设等方面适当倾斜，帮助湖北解决实际困难和具体问题，在湖北最艰难的时期搭把手、拉一把，帮助湖北早日全面步入正常轨道，同全国一道完成决胜全面建成小康社会各项任务",@"对武汉和湖北的工作，习近平总书记在会上谈了6点意见。一场没有硝烟的战争，一场人民战争、总体战、阻击战。“武汉胜则湖北胜，湖北胜则全国胜。”他强调：“湖北和武汉的疫情防控，不仅事关一省一城，更关乎全国大局。”在这场疫情防控最重要的医疗战线上，全国340多支医疗队、4万多名医务人员火线驰援，和湖北、和武汉一道爬山过坎。习近平总书记再三叮嘱，要高度重视对广大医务工作者的保护关心爱护，加强防护物资保障……"];
    
    [self pTableView];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath{

    NSString * str = self.dataArray[indexPath.row];
    CGFloat height = [CustomCell cellHeight:str]+10;
    return height;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * str = self.dataArray[indexPath.row];
    NSString * cellId = @"cell";
    CustomCell * cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell==nil)
    {
        cell =[[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.strText = str;
    return cell;
}
-(UITableView *)pTableView
{
    if(_pTableView==nil)
    {
        _pTableView =[[UITableView alloc]init];
        _pTableView.frame = self.view.bounds;
        _pTableView.delegate = self;
        _pTableView.dataSource = self;
        _pTableView.tableFooterView =[UIView new];
        [self.view addSubview:_pTableView];
    }
    return _pTableView;
}

@end
