//
//  SecondViewController.m
//  Nuclear_Power
//
//  Created by 千锋 on 15/11/28.
//  Copyright (c) 2015年 师. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondModel.h"
#import "SecondCollectionViewCell.h"

@interface SecondViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic)UICollectionView *collection;
@property (strong, nonatomic)NSMutableArray *dataArray;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatData];
    [self creatCollectionView];
    
}
- (void)creatData
{
    _dataArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    
    SecondModel *model = [[SecondModel alloc]init];
    model.author = [NSString stringWithFormat:@"中国核电网   | 发表于：2015-11-12 "];
    model.articleItem = [NSString stringWithFormat:@"   焦虑的核电：舆论之下\n   天使还是恶魔？"];
    //打开文件
    model.article = NuclearArticle;
        [_dataArray addObject:model];
    
    [_collection reloadData];
    
}
- (void)creatCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.itemSize = self.view.bounds.size;
    
    _collection = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collection.delegate = self;
    _collection.dataSource = self;
    //注册复用池
    [_collection registerClass:[SecondCollectionViewCell class] forCellWithReuseIdentifier:@"SecondCollectionViewCell"];
    _collection.pagingEnabled = YES;
    
    [self.view addSubview:_collection];
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SecondCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SecondCollectionViewCell" forIndexPath:indexPath];
    [cell layoutInfoWithModel:_dataArray[indexPath.item]];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
