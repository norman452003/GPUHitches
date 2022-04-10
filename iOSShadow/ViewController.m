//
//  ViewController.m
//  iOSShadow
//
//  Created by gx on 2021/1/23.
//

#import "ViewController.h"
#import "AHTestTableViewCell.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UIImage *image;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *src = [[NSBundle mainBundle] pathForResource:@"123" ofType:@"jpeg"];
    self.image = [UIImage imageWithContentsOfFile:src];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 900;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AHTestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reusecell"];
    if (!cell) {
        cell = [[AHTestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reusecell"];
    }
    cell.titleLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.img = self.image;
    return cell;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


@end
