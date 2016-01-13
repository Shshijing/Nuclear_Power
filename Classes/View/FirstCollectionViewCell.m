//
//  FirstCollectionViewCell.m
//  Nuclear_Power
//
//  Created by 千锋 on 15/11/30.
//  Copyright (c) 2015年 师. All rights reserved.
//

#import "FirstCollectionViewCell.h"
#import "NulearFile.h"

#define ImageHight 400

@interface FirstCollectionViewCell()

@property (strong , nonatomic)UIScrollView *backScroll;
@property (strong , nonatomic)UILabel *articleLabel;
@property (strong , nonatomic)UILabel *authorLabel;
@property (strong , nonatomic)UIButton *photoImage;

@end


@implementation FirstCollectionViewCell


-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self creatUI];
    }
    return self;
}

-(void)creatUI{
    _backScroll = [[UIScrollView alloc]initWithFrame:self.bounds];
    _backScroll.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_backScroll];
    //在_backScroll上添加背景图
    UIImage *image = [UIImage imageNamed:@"backScrollImage.jpeg"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:_backScroll.frame];
    imageView.image = image;
    [_backScroll addSubview:imageView];
    
    //文章
    _articleLabel = [[UILabel alloc]init];
    _articleLabel.font = [UIFont systemFontOfSize:16];
    _articleLabel.backgroundColor = [UIColor cyanColor];
    _articleLabel.alpha = 0.5;
    [_backScroll addSubview:_articleLabel];
    
    //作者
    _authorLabel = [[UILabel alloc]init];
    [_backScroll addSubview:_authorLabel];
    
    //图片
    _photoImage = [UIButton buttonWithType:UIButtonTypeCustom];
    [_photoImage addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    _photoImage.backgroundColor = [UIColor cyanColor];
    [_backScroll addSubview:_photoImage];
}

-(void)layoutInfoWithModel:(firstModel *)model{
    //图片的位置
    _photoImage.frame = CGRectMake(10, 10, ScreenSize.width-20, 200);
    [_photoImage setBackgroundImage:model.image forState:UIControlStateNormal];
    _photoImage.layer.cornerRadius = 5;
    _photoImage.layer.borderWidth = 3;
    _photoImage.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _photoImage.layer.shadowColor = [UIColor blackColor].CGColor;
    _photoImage.layer.shadowOpacity = 0.5;
    _photoImage.clipsToBounds = YES;
    
    //文献出处
    _authorLabel.text = model.author;
    _authorLabel.frame = CGRectMake(ScreenSize.width-150, 10+200+10, 100, 13);
    _authorLabel.font = [UIFont boldSystemFontOfSize:14];
    
    //对应科普文章的位置
    _articleLabel.text = model.article;
    CGRect subBounds = [model.article boundingRectWithSize:CGSizeMake(200, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}  context:nil];
    _articleLabel.frame = CGRectMake(10, 10+200+10+_authorLabel.frame.size.height+10, ScreenSize.width-20, subBounds.size.height);
    _articleLabel.numberOfLines = 0;
    _articleLabel.layer.cornerRadius = 10;
    _articleLabel.clipsToBounds = YES;

    
    _backScroll.contentSize = CGSizeMake(self.bounds.size.width, _articleLabel.frame.origin.y+_articleLabel.frame.size.height + 120);
}
-(void)pressButton:(UIButton*)button{
    UIButton *Bn = [UIButton buttonWithType:UIButtonTypeSystem];
    Bn.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    Bn.frame = self.bounds;
    [Bn addTarget:self action:@selector(pressBn:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:Bn];
    
    //取背景图片
    UIImage *image = [button currentBackgroundImage];
    
    
    UIImageView *imageView = [[UIImageView alloc]init];
    float scale = self.bounds.size.width/button.frame.size.width;
    imageView.frame = CGRectMake(0, 0, self.bounds.size.width, button.frame.size.height*scale);
    CGPoint location = self.contentView.center;
    location.y -= 100;
    
    imageView.center = location;
    imageView.tag = 101;
    imageView.image = image;
    [self.contentView addSubview:imageView];
}
-(void)pressBn:(UIButton *)button{
    UIImageView *photo = (UIImageView*)[self.contentView viewWithTag:101];
    [UIView animateWithDuration:1 animations:^{
        CGRect buttonRect = button.frame;
        buttonRect.origin.x += self.contentView.bounds.size.width;
        button.frame = buttonRect;
        CGRect photoRect = photo.frame;
        photoRect.origin.x = self.contentView.bounds.size.width;
        photo.frame = photoRect;
    } completion:^(BOOL finished) {
        [button removeFromSuperview];
        [photo removeFromSuperview];
    }];
}


@end
