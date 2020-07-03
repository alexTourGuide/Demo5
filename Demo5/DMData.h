//
//  DMData.h
//  Demo5
//
//  Created by Alexander Porshnev on 6/18/20.
//  Copyright © 2020 Alexander Porshnev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DMData : NSObject

@property (nonnull, nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) UIImage *image;

- (id)initWithURL:(NSString *)string;
- (void)startWithIndexPath:(NSIndexPath *)indexPath handler:(void (^)(UIImage *image, NSIndexPath *indexPath))callBack;

@end

NS_ASSUME_NONNULL_END
