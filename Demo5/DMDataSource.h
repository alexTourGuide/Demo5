//
//  DMDataSource.h
//  Demo5
//
//  Created by Alexander Porshnev on 6/18/20.
//  Copyright © 2020 Alexander Porshnev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DMData.h"

NS_ASSUME_NONNULL_BEGIN

@interface DMDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray<DMData *> *arrayData;

+ (NSString *)cellIdentifier;
- (id)initWithArray:(NSArray<DMData *>*)array;

@end

NS_ASSUME_NONNULL_END
