//
//  KPSNSLoginVC.m
//  BKaoPush
//
//  Created by Jincang Lu on 2016/10/31.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPSNSLoginVC.h"

@interface KPSNSLoginVC ()
{
    UITextField * _nameTF;
    UITextField * _passTF;
    UIButton    * _loginBtn;
    UIButton    * _findBtn;
    UIButton    * _registerBtn;
    UIButton    * _snsBtn;
    UIButton    * _verityBtn;
    NSTimer     * _timer;
    int            time;
}
@end

@implementation KPSNSLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createLeftBarButtonItem];
    // [self setMyTitle:@"用户登录"];
    [self setMyTitle:@"用户登录"];
    time =60;
    [self createUI];
}


#pragma mark 登录响应事件

- (void)loginAction:(UIButton *)button{
    
    NSLog(@"点击了登录按钮");
    [self respond];
    if ([KPTool valiMobile:_nameTF.text]&&_passTF.text.length>0) {
        
        [self requestLogin];
    }
    else{
        [KPProgress showResultText:@"请检查信息"];
    }
    
}

#pragma mark 切换到账号密码界面

- (void)snsAction:(UIButton *)button{
    
    NSLog(@"点击了账户密码");
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 获取手机短信验证码

- (void)verityAction:(UIButton *)button{
    
    NSLog(@"点击了获取验证码");
    
    if ([KPTool valiMobile:_nameTF.text]) {
        
        [self requestVeritfy];
        
    }
    else{

        [KPProgress showResultText:@"非法手机号"];
    }
    
    
}




- (void) requestLogin
{
    [self outLoginAction];
    
    [KPProgress showLoadingText:@"正在登陆"];
    
    [KPDownload snsLoginData:^(id obj, NSError *err) {
        
        if (obj) {
            NSDictionary * dict = obj;
            if (KP_STATUS(dict[@"status"])==1) {
                
                [KPProgress showResultText:@"登陆成功"];
                //--------------
                
                [KPUserDefault setObject:_nameTF.text forKey:PHONE];
                
                //--------------
                [KPTool writeUserinfo:dict[@"data"]];
                //这快 需要写数据了
                [KPNotCenter postNotificationName:USER_INFO object:nil];
                //---------
                self.block();
                //登录时的习销毁
                //[self.delegate KPLoginBAction];

                
                //---------
                
                
//                [self dismissViewControllerAnimated:YES completion:nil];
            }
            else{

                [KPProgress showResultText:KP_STRING(dict[@"error"])];
                
            }
        }
        else{
            
            [KPProgress showResultText:KP_ERROR];
        }

        
    } withPhoneNumber:_nameTF.text withMsgCode:_passTF.text];
}


- (void) requestVeritfy
{
    
    [KPProgress showLoadingText:@"正在获取验证码"];
    
    [KPDownload setGetVeritfyData:^(id obj, NSError *err) {
        
        
        if (obj) {
            [KPProgress hidle];
            NSDictionary * dict = obj;
            if (KP_STATUS(dict[@"status"]) ==1) {
                
                [KPProgress showResultText:@"获取验证码成功"];
                
                [_verityBtn setTitle:@"60S 后重新获取" forState:UIControlStateNormal];
                [self startTimer];
                
            }
            else{
                [KPProgress hidle];
                [KPProgress showResultText:KP_STRING(dict[@"error"])];

                [_verityBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
            }
        }
        else{
            [KPProgress showResultText:KP_ERROR];
        }
        
    } withPhoneNumber:_nameTF.text];
}






- (void) startTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerActions) userInfo:nil repeats:YES];
}

#pragma mark 找回密码

- (void)findAction:(UIButton *)button{
    
    NSLog(@"点击了找回密码");
}


- (void)timerActions{
    
    if (time== 1) {
        
        _verityBtn.enabled = YES;
        time=60;
        [_timer invalidate];
        [_verityBtn setTitle:@"重新获取" forState:UIControlStateNormal];
    }
    else{
        
        _verityBtn.enabled = NO;
        time--;
        [_verityBtn setTitle:[NSString stringWithFormat:@"%dS 后重新获取",time] forState:UIControlStateNormal];
    }
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField==_nameTF) {
        
        [_passTF becomeFirstResponder];
    }
    else{
        
        
        [self respond];
    }
    
    return YES;
}

- (void) respond{
    
    [_nameTF resignFirstResponder];
    [_passTF resignFirstResponder];
}

#pragma mark 点击手机快速注册

- (void)registerAction:(UIButton *)button{
    
    
}


- (void)textFiledChanged2:(NSNotificationCenter *)notf{
    
    if (_nameTF.text.length>0&&_passTF.text.length>0) {
        
        _loginBtn.enabled = YES;
    }
    else{
        
        _loginBtn.enabled = NO;
    }
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self respond];
}


- (void)createUI{
    
    
    
    UIImageView *logoIMV =[[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth-GOOD_W)/2.0, 3 * TAP, GOOD_W, GOOD_W)];
    logoIMV.image = IMAGE(@"logo");
    [self.view addSubview:logoIMV];
    
    NSString * logoStr =@"靠铺商家登录";
    UILabel *logoLab =[[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(logoIMV.frame)+TAP, ScreenWidth, AUTO_H(logoStr, [KPTool systemFont:20]))];
    logoLab.font =[KPTool systemFontS:20];
    logoLab.textAlignment =NSTextAlignmentCenter;
    logoLab.text =logoStr;
    [self.view addSubview:logoLab];
    
    
    
    CGRect frame = CGRectMake(20, CGRectGetMaxY(logoLab.frame)+TAP, ScreenWidth-40, 40);
    _nameTF = [[UITextField alloc] initWithFrame:frame];
    //_nameTF.borderStyle = UITextBorderStyleRoundedRect;
    _nameTF.placeholder = @"请输入用户名/手机号";
    _nameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _nameTF.delegate = self;
    _nameTF.returnKeyType = UIReturnKeyNext;
    [self.view addSubview:_nameTF];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    label.text = @"账号";
    label.font = [UIFont systemFontOfSize:16];
    _nameTF.leftView = label;
    _nameTF.leftViewMode = UITextFieldViewModeAlways;
    
    frame = CGRectMake(10, CGRectGetMaxY(_nameTF.frame)+4, ScreenWidth, 1);
    UIView * line1 = [[UIView alloc] initWithFrame:frame];
    line1.backgroundColor = [UIColor colorWithWhite:0.827 alpha:1.000];
    [self.view addSubview:line1];
    
    frame = CGRectMake(20, CGRectGetMaxY(_nameTF.frame)+10, (ScreenWidth-40)/3*2-5, 40);
    _passTF = [[UITextField alloc] initWithFrame:frame];
    //_passTF.borderStyle = UITextBorderStyleRoundedRect;
    _passTF.placeholder = @"请输入验证码";
    _passTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passTF.delegate = self;
    [_passTF setSecureTextEntry:YES];
    _passTF.returnKeyType = UIReturnKeyContinue;
    [self.view addSubview:_passTF];
    
    
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    label1.text = @"验证码";
    label1.font = [UIFont systemFontOfSize:16];
    _passTF.leftView = label1;
    _passTF.leftViewMode = UITextFieldViewModeAlways;
    
    
    frame = CGRectMake(10, CGRectGetMaxY(_passTF.frame)+4, ScreenWidth, 1);
    UIView * line2 = [[UIView alloc] initWithFrame:frame];
    line2.backgroundColor = [UIColor colorWithWhite:0.827 alpha:1.000];
    [self.view addSubview:line2];
    
    
    
    
    
    
    frame = CGRectMake(CGRectGetMaxX(_passTF.frame)+5, CGRectGetMaxY(_nameTF.frame)+10, (ScreenWidth-40)/3, 40);
    _verityBtn = [[UIButton alloc] initWithFrame:frame];
    _verityBtn.layer.borderWidth = 1;
    _verityBtn.layer.cornerRadius = 3;
    _verityBtn.layer.borderColor = [UIColor grayColor].CGColor;
    [_verityBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    _verityBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_verityBtn addTarget:self action:@selector(verityAction:) forControlEvents:UIControlEventTouchUpInside];
    [_verityBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:_verityBtn];
    
    
    
    frame = CGRectMake(20, CGRectGetMaxY(_passTF.frame)+30, ScreenWidth-40, 40);
    _loginBtn = [[UIButton alloc] initWithFrame:frame];
    // _loginBtn.layer.borderWidth = 1;
    _loginBtn.layer.cornerRadius = 5;
    // _loginBtn.layer.borderColor = [UIColor grayColor].CGColor;
    // [_loginBtn setTitle:@"登     录" forState:UIControlStateNormal];
    [_loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    _loginBtn.enabled = NO;
    //  [_loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    // [_loginBtn setBackgroundColor:[UIColor colorWithWhite:0.796 alpha:1.000]];
    [_loginBtn setImage:[KPTool readImage:@"buton_2" type:@".png"] forState:UIControlStateNormal];
    [_loginBtn setImage:[KPTool readImage:@"buton_2_highlighted" type:@".png"] forState:UIControlStateHighlighted];
    [_loginBtn setImage:IMAGE(@"disablebtn") forState:UIControlStateDisabled];
    [self.view addSubview:_loginBtn];
    
    UILabel * loginTitle = [[UILabel alloc] initWithFrame:_loginBtn.bounds];
    loginTitle.text = @"登   录";
    loginTitle.textAlignment = NSTextAlignmentCenter;
    [_loginBtn addSubview:loginTitle];
    
    
//    frame = CGRectMake(20, CGRectGetMaxY(_loginBtn.frame)+10, (ScreenWidth-40)/2.0, 30);
//    _registerBtn = [[UIButton alloc] initWithFrame:frame];
//    [_registerBtn setTitle:@"手机快速注册" forState:UIControlStateNormal];
//    _registerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [_registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [_registerBtn addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
//    _registerBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//    [self.view addSubview:_registerBtn];
    
    frame = CGRectMake(ScreenWidth-(ScreenWidth-40)/2.0-20, CGRectGetMaxY(_loginBtn.frame)+10, (ScreenWidth-40)/2.0, 30);
    _findBtn = [[UIButton alloc] initWithFrame:frame];
    [_findBtn setTitle:@"找回密码" forState:UIControlStateNormal];
    [_findBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _findBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    _findBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_findBtn addTarget:self action:@selector(findAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_findBtn];
    // [_findBtn setTitleColor:[UIColor colorWithRed:0.000 green:0.357 blue:0.988 alpha:1.000] forState:UIControlStateNormal];
    
    frame = CGRectMake(0, ScreenHeight-40, ScreenWidth, 20);
    _snsBtn = [[UIButton alloc] initWithFrame:frame];
    [_snsBtn setTitle:@"账户密码登录" forState:UIControlStateNormal];
    _snsBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_snsBtn setEnlargeEdgeWithTop:0 right:0 bottom:20 left:20];
    [_snsBtn addTarget:self action:@selector(snsAction:) forControlEvents:UIControlEventTouchUpInside];
    [_snsBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:_snsBtn];
    
}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden =YES;
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledChanged2:) name:UITextFieldTextDidChangeNotification object:nil];
    
    self.navigationController.navigationBar.hidden =YES;
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    [_timer invalidate];
    _timer = nil;
    
    self.navigationController.navigationBar.hidden =NO;
    
    NSLog(@"  delloc  ");
}

- (void) outLoginAction
{
    [KPTool outUserInfo];
    [[NSNotificationCenter defaultCenter] postNotificationName:USER_INFO object:nil];
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
