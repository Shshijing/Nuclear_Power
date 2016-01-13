//
//  FirstViewController.m
//  Nuclear_Power
//
//  Created by 千锋 on 15/11/28.
//  Copyright (c) 2015年 师. All rights reserved.
//

#import "FirstViewController.h"
#import "firstModel.h"
#import "FirstCollectionViewCell.h"

@interface FirstViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic)UICollectionView *collection;
@property (strong, nonatomic)NSMutableArray *dataArray;
@property (strong, nonatomic)NSArray *articleArray;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    //self.view.backgroundColor = UIColorFromRGB(0x34465C);
    
    //一开始弹出警告框
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning!" message:@"您将进入新的能源世界" delegate:self cancelButtonTitle:@"我想了解" otherButtonTitles:@"我准备好了",@"我就不告诉你我很感兴趣",nil];
    [alert show];
    
    [self creatCollectionView];
    [self creatData];
}
- (void)creatData
{
    _dataArray = [[NSMutableArray alloc]initWithCapacity:0];
    _articleArray = @[ArticleOne,ArticleTwo];
    for (int i = 0; i < 2; i++) {
        firstModel *model = [[firstModel alloc]init];
        model.author = [NSString stringWithFormat:@"爱衬衣的S先森"];
        model.article = _articleArray[i];
        NSString *path = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"a%d",i] ofType:@"png"];
        model.image = [UIImage imageWithContentsOfFile:path];
        [_dataArray addObject:model];
    }
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
    [_collection registerClass:[FirstCollectionViewCell class] forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
    _collection.pagingEnabled = YES;
    
    [self.view addSubview:_collection];
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FirstCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FirstCollectionViewCell" forIndexPath:indexPath];
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
