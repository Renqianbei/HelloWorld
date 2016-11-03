//
//  KPBaseVC.h
//  BKaoPush
//
//  Created by Jincang Lu on 2016/10/18.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,RightItemType) {
    RightItemTypeImage,
    RightItemTypeTxt,
    RightDefault
};


@interface KPBaseVC : UIViewController <UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>


@property (nonatomic,copy) UITableView * rootTableView;

@property (nonatomic,retain) NSMutableArray * rootDataSource;

//基类的左barbutton
@property (nonatomic, retain) UIButton *leftButton;

//基类的右barbutton
@property (nonatomic, retain) UIButton *rightButton;

//@property (nonatomic,copy) MJRefreshHeaderView * refreshHeaderView;
//
//@property (nonatomic,copy) MJRefreshFooterView * refreshFooterView;


/**
 *  root里面的tableView
 */
-(void)createRootTableView;

//重新登录
- (void) presentLogin;
/**
 *  父类的写左按钮的方法
 */
-(void)createLeftBarButtonItem;

//主页左按钮
-(void)createMainLeftBarButtonItem;

/**
 *  需要上下拉刷新调用此方法
 */

-(void)createRootTableView:(BOOL)isGroup;


/**
 *  父类创建title
 *
 *  @param titleStr 重写头标题
 */
-(void)setMyTitle:(NSString *)titleStr;

/**
 *  右按钮添加方法
 */
-(void)createRightBarButtonItem:(RightItemType)itemType text:(NSString *)text;


/**
 *  右按钮方法需要重写
 */
-(void)rightBarButtonItemAction;

/**
 *  左按钮方法需要重写
 */
-(void)leftBarButtonItemAction;


/**
 *  MJRefresh头视图执行的方法
 */
-(void)rootRefreshHeaderAction;


/**
 *  MJRefresh尾视图执行的方法
 */
-(void)rootRefreshFooterAction;

/**
 *  上拉刷新开始
 */
-(void)beginRootRefresh_header;

/**
 *  下拉刷新开始
 */
-(void)beginRootRefresh_footer;



/**
 *  上拉刷新结束
 */
-(void)endRootRefresh_header;

/**
 *  下拉加载结束
 */
-(void)endRootRefresh_footer;

@end
