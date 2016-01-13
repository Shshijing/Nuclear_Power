//
//  SecondCollectionViewCell.m
//  Nuclear_Power
//
//  Created by 千锋 on 15/12/1.
//  Copyright (c) 2015年 师. All rights reserved.
//

#import "SecondCollectionViewCell.h"
#import "NulearFile.h"

@interface SecondCollectionViewCell()

@property (strong, nonatomic)UIScrollView *backScroll;
@property (strong, nonatomic)UILabel *articleItemLabel;
@property (strong, nonatomic)UILabel *articleLabel;
@property (strong, nonatomic)UILabel *authorLabel;

@end

@implementation SecondCollectionViewCell

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
    UIImage *image = [UIImage imageNamed:@"9d7424d4157431cc1b9ca03af3710ca9.jpeg"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:_backScroll.frame];
    imageView.image = image;
    //[_backScroll addSubview:imageView];
    
    //文章标题
    _articleItemLabel = [[UILabel alloc]init];
    _articleItemLabel.font = [UIFont boldSystemFontOfSize:26];
    
    _articleItemLabel.alpha = 0.8;
    [_backScroll addSubview:_articleItemLabel];
    
    //文章
    _articleLabel = [[UILabel alloc]init];
    _articleLabel.font = [UIFont systemFontOfSize:16];
    _articleLabel.backgroundColor = [UIColor purpleColor];
    _articleLabel.alpha = 0.5;
    [_backScroll addSubview:_articleLabel];
    
    //作者
    _authorLabel = [[UILabel alloc]init];
    [_backScroll addSubview:_authorLabel];

}

-(void)layoutInfoWithModel:(SecondModel *)model{
    
    //文章标题
    _articleItemLabel.text = model.articleItem;
    _articleItemLabel.frame = CGRectMake(10, 10, ScreenSize.width, 0);
    _articleItemLabel.numberOfLines = 0;
    [_articleItemLabel sizeToFit];
    _articleItemLabel.textAlignment = NSTextAlignmentCenter;
    
    //文献出处
    _authorLabel.text = model.author;
    _authorLabel.frame = CGRectMake(10, 10+70+5, ScreenSize.width, 15);
    _authorLabel.font = [UIFont boldSystemFontOfSize:14];
    

    //对应科普文章的位置
    _articleLabel.text = model.article;
    CGRect subBounds = [model.article boundingRectWithSize:CGSizeMake(200, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}  context:nil];
    _articleLabel.frame = CGRectMake(10, 10+70,ScreenSize.width-20,subBounds.size.height);
    _articleLabel.numberOfLines = 0;
    _articleLabel.layer.cornerRadius = 10;
    _articleLabel.clipsToBounds = YES;
    
    //
    _backScroll.contentSize = CGSizeMake(self.bounds.size.width, 10+70+5+15+5+subBounds.size.height+10+20);

}



@end
