#import "DemoViewController.h"
#import "DMData.h"
#import "DMDataSource.h"

@interface DemoViewController () <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<DMData *> *arrayData;
@property (nonatomic, strong) DMDataSource *dataSource;

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *array = @[
    @"https://wallpapercave.com/wp/5jZ0i96.jpg", @"https://wallpapercave.com/wp/1Ro1uO1.jpg",
    @"https://wallpapercave.com/wp/Rnaik1L.jpg", @"https://wallpapercave.com/wp/c2ZpDeN.jpg",
    @"https://wallpapercave.com/wp/lcS7Rpu.jpg", @"https://wallpapercave.com/wp/ieJiM39.jpg",
    @"https://wallpapercave.com/wp/iaxSYJh.jpg", @"https://wallpapercave.com/wp/xB2xeP4.jpg",
    @"https://wallpapercave.com/wp/pGKDgc0.jpg", @"https://wallpapercave.com/wp/2Nu632g.jpg",
    @"https://wallpapercave.com/wp/cG3JlA6.jpg", @"https://wallpapercave.com/wp/G21YdeB.jpg",
    @"https://wallpapercave.com/wp/fS9YxBp.jpg", @"https://wallpapercave.com/wp/ua86b76.jpg",
    @"https://wallpapercave.com/wp/QIRWN29.jpg", @"https://wallpapercave.com/wp/fZlhEYp.jpg",
    @"https://wallpapercave.com/wp/TTy71cO.jpg", @"https://wallpapercave.com/wp/Ay5DK8D.jpg",
    @"https://wallpapercave.com/wp/HNm6MnW.jpg", @"https://wallpapercave.com/wp/qSb27v4.jpg",
    @"https://wallpapercave.com/wp/gXNRUiu.jpg", @"https://wallpapercave.com/wp/PrFy8mM.jpg",
    @"https://wallpapercave.com/wp/M5LFNK7.jpg", @"https://wallpapercave.com/wp/xstaeZS.jpg"
    ];
    NSMutableArray *arrayData = [NSMutableArray array];
    for (NSString *strUrl in array) {
        DMData *data = [[DMData alloc] initWithURL:strUrl];
        [arrayData addObject:data];
    }
    
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:[DMDataSource cellIdentifier]];
    self.tableView.delegate = self;
    
    self.dataSource = [[DMDataSource alloc] initWithArray:arrayData];
    self.tableView.dataSource = self.dataSource;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *str = [NSString stringWithFormat:@"%ld, %ld", (long)indexPath.row, (long)indexPath.section];
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Title" message:str preferredStyle:UIAlertControllerStyleAlert];
    [controller addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:controller animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}

@end
