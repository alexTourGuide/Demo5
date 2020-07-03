//
//  DMData.m
//  Demo5
//
//  Created by Alexander Porshnev on 6/18/20.
//  Copyright © 2020 Alexander Porshnev. All rights reserved.
//

#import "DMData.h"

@interface DMData()
@property (nonatomic, copy) void (^_callBack)(UIImage *image, NSIndexPath *indexPath);
@end

@implementation DMData

- (id)initWithURL:(NSString *)string {
    self = [super init];
    if (self) {
        _url = [NSURL URLWithString:string];
    }
    return self;
}

- (void)startWithIndexPath:(NSIndexPath *)indexPath handler:(void (^)(UIImage *image, NSIndexPath *indexPath))callBack {
    self._callBack = callBack;
    
    if (self.image != nil) {
        return;
    }
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:weakSelf.url];
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.image = image;
            if (image) {
                weakSelf._callBack(image, indexPath);
            }
        });
    });
    
}

@end
