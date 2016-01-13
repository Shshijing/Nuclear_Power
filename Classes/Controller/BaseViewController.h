//
//  BaseViewController.h
//  Nuclear_Power
//
//  Created by 千锋 on 15/11/28.
//  Copyright (c) 2015年 师. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NulearFile.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface BaseViewController : UIViewController



@end
