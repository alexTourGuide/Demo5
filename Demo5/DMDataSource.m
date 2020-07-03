//
//  DMDataSource.m
//  Demo5
//
//  Created by Alexander Porshnev on 6/18/20.
//  Copyright © 2020 Alexander Porshnev. All rights reserved.
//

#import "DMDataSource.h"

@implementation DMDataSource

- (id)initWithArray:(NSArray<DMData *> *)array {
    self = [super init];
    if (self) {
        self.arrayData = [NSMutableArray arrayWithArray:array];
    }
    return self;
}

+ (NSString *)cellIdentifier {
    return @"cell";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DMDataSource cellIdentifier] forIndexPath:indexPath];
    DMData *data = self.arrayData[indexPath.row];
    [data startWithIndexPath:indexPath handler:^(UIImage * _Nonnull image, NSIndexPath * _Nonnull indexPath) {
        [tableView beginUpdates];
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        [tableView endUpdates];
    }];
    if (data.image) {
        cell.imageView.image = data.image;
    } else {
        cell.imageView.image = [UIImage imageNamed:@"imageDemo"];
    }
    return cell;
}

@end
