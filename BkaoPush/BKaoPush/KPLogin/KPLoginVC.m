//
//  KPLoginVC.m
//  BKaoPush
//
//  Created by Jincang Lu on 2016/10/30.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPLoginVC.h"
#import "KPSNSLoginVC.h"

@interface KPLoginVC ()
{
    UITextField * _nameTF;
    UITextField * _passTF;
    UIButton    * _loginBtn;
    UIButton    * _findBtn;
    UIButton    * _registerBtn;
    UIButton    * _snsBtn;
    UITextField * _verityTF;
    UIButton    * _verityBtn;
    UIButton    * _eyeBtn;
    BOOL          error;
    NSString    * veritfyStr;
}
@end

@implementation KPLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    self.view.backgroundColor = [UIColor whiteColor];

    [self createUI];
    
    _nameTF.text =@"13999999999";
    _passTF.text =@"abc123";
    _loginBtn.enabled =YES;
    
}


- (void)leftBarButtonItemAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 登录响应事件

- (void)loginAction:(UIButton *)button{
    
    NSLog(@"点击了登录按钮 %@",_verityTF.text);
    [self respond];
    
    
    if ([KPTool valiMobile:_nameTF.text]&&[KPTool isPassword:_passTF.text]) {
        
        [self requestLogin];
    }
    else{
        [KPProgress showResultText:@"账号或密码不正确"];
    }
    
}


#pragma mark 网络请求登录 信息
- (void) requestLogin{
    
    
    [KPProgress showLoadingText:@"正在登陆"];
    
    [KPTool outUserInfo];
    
    [KPRequest loginData:^(id obj, NSError *err) {
        
        
        if (obj) {
            
            NSDictionary *dict =obj;
            
            //NSLog(@"--%@--",dict);
            [KPProgress hidle];
            if (KP_STATUS(dict[@"status"])) {
                
                [KPProgress showResultText:@"登陆成功"];
                [KPUserDefault setObject:_nameTF.text forKey:PHONE];
                
                //--------------
                [KPTool writeUserinfo:dict[@"data"]];
                //这快 需要写数据了
                [KPNotCenter postNotificationName:USER_INFO object:nil];
                //---------
                //登录时的习销毁
                [self.delegate KPLoginBAction];
                
//                //适用于非启动APP 时的状态 销毁
//                [self dismissViewControllerAnimated:YES completion:nil];
            }
            else{
                
                [KPProgress hidle];
                NSDictionary *dic =dict[@"data"];
                NSString *veritfy =KP_STRING(dic[@"key"]);
                if (veritfy.length > 0) {
                    
                    NSLog(@"需要输入验证码");
                    [self verityUI:veritfy];
                    
                }
                [KPProgress showResultText:KP_STRING(dic[@"error"])];
                
            }
        }
        else{
            
            [KPProgress showResultText:@"网络异常登录失败"];

        }

        
    } withPhoneNumber:_nameTF.text withPass:[_passTF.text MD5Hash] withVerity:_verityTF?_verityTF.text:@""];
    
    
}




#pragma mark 验证码登录

- (void)registerAction:(UIButton *)button{
    
    KPSNSLoginVC *snsLogin =[[KPSNSLoginVC alloc] init];
    snsLogin.block =^{
    
        [self.delegate KPLoginBAction];
    };
    [self.navigationController pushViewController:snsLogin animated:YES];
}

#pragma mark 获取服务器验证码

- (void) verityAction:(UIButton *)button{
    
    
    
    
    
    NSLog(@"点击获取了验证码");
}

#pragma mark 找回密码
- (void)findAction:(UIButton *)button{
    
    NSLog(@"点击找回密码");
    
}




- (void) respond{
    
    [_nameTF resignFirstResponder];
    [_passTF resignFirstResponder];
    [_verityTF resignFirstResponder];
}




- (void)textFiledChanged:(NSNotification *)notf{
    
    if (_nameTF.text.length>0&&_passTF.text.length>0) {
        
        _loginBtn.enabled = YES;
        if (error&&_verityTF.text.length==0) {
            _loginBtn.enabled = NO;
        }
    }
    else{
        _loginBtn.enabled = NO;
    }
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self respond];
}



- (void) eyeAction:(UIButton *)button
{
    button.selected = !button.selected;
    if (button.selected) {
        [_passTF setSecureTextEntry:NO];
    }
    else{
        [_passTF setSecureTextEntry:YES];
    }
}





#pragma mark 界面

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
    
    frame = CGRectMake(20, CGRectGetMaxY(_nameTF.frame)+10, ScreenWidth-40, 40);
    _passTF = [[UITextField alloc] initWithFrame:frame];
    //_passTF.borderStyle = UITextBorderStyleRoundedRect;
    _passTF.placeholder = @"请输入密码";
    _passTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passTF.delegate = self;
    [_passTF setSecureTextEntry:YES];
    _passTF.returnKeyType = UIReturnKeyContinue;
    [self.view addSubview:_passTF];
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    label1.text = @"密码";
    label1.font = [UIFont systemFontOfSize:16];
    _passTF.leftView = label1;
    _passTF.leftViewMode = UITextFieldViewModeAlways;
    
    _eyeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 7.5, 25, 25)];
    //_eyeBtn.backgroundColor = [UIColor redColor];
    [_eyeBtn setImage:IMAGE(@"眼睛2") forState:UIControlStateNormal];
    [_eyeBtn setImage:IMAGE(@"眼睛1") forState:UIControlStateSelected];
    [_eyeBtn addTarget:self action:@selector(eyeAction:) forControlEvents:UIControlEventTouchUpInside];
    _passTF.rightView = _eyeBtn;
    _passTF.rightViewMode = UITextFieldViewModeAlways;
    
    
    frame = CGRectMake(10, CGRectGetMaxY(_passTF.frame)+4, ScreenWidth, 1);
    UIView * line2 = [[UIView alloc] initWithFrame:frame];
    line2.backgroundColor = [UIColor colorWithWhite:0.827 alpha:1.000];
    [self.view addSubview:line2];
    
    frame = CGRectMake(20, CGRectGetMaxY(_passTF.frame)+30, ScreenWidth-40, 40);
    _loginBtn = [[UIButton alloc] initWithFrame:frame];
    _loginBtn.layer.cornerRadius = 5;
    // [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    [_loginBtn setImage:[KPTool readImage:@"buton_2" type:@".png"] forState:UIControlStateNormal];
    [_loginBtn setImage:[KPTool readImage:@"buton_2_highlighted" type:@".png"] forState:UIControlStateHighlighted];
    [_loginBtn setImage:IMAGE(@"disablebtn") forState:UIControlStateDisabled];
    _loginBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -ViewWidth(_loginBtn)*2, 0, -ViewWidth(_loginBtn)*0.5);
    _loginBtn.titleLabel.backgroundColor =[UIColor redColor];
    
    [self.view addSubview:_loginBtn];
    _loginBtn.enabled = NO;
    
    UILabel * loginTitle = [[UILabel alloc] initWithFrame:_loginBtn.bounds];
    loginTitle.text = @"登   录";
    loginTitle.textAlignment = NSTextAlignmentCenter;
    [_loginBtn addSubview:loginTitle];
    
    
    frame = CGRectMake(20, CGRectGetMaxY(_loginBtn.frame)+10, (ScreenWidth-40)/2.0, 30);
    _registerBtn = [[UIButton alloc] initWithFrame:frame];
    [_registerBtn setTitle:@"验证码登录" forState:UIControlStateNormal];
    _registerBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    _registerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_registerBtn addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerBtn];
    
    frame = CGRectMake(CGRectGetMaxX(_registerBtn.frame), CGRectGetMaxY(_loginBtn.frame)+10, (ScreenWidth-40)/2.0, 30);
    _findBtn = [[UIButton alloc] initWithFrame:frame];
    [_findBtn setTitle:@"找回密码" forState:UIControlStateNormal];
    _findBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_findBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_findBtn addTarget:self action:@selector(findAction:) forControlEvents:UIControlEventTouchUpInside];
    _findBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.view addSubview:_findBtn];
    
    
    frame = CGRectMake(0, ScreenHeight-40, ScreenWidth, 20);
    _snsBtn = [[UIButton alloc] initWithFrame:frame];
    [_snsBtn setTitle:@"客服热线: 400-9000-900" forState:UIControlStateNormal];
    _snsBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//    [_snsBtn addTarget:self action:@selector(snsAction:) forControlEvents:UIControlEventTouchUpInside];
    [_snsBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:_snsBtn];
    
}

- (void)verityUI:(NSString *)base64{
    
    _loginBtn.enabled = NO;
    UILabel * label;
    UIView * line2;
    
    [_verityTF removeFromSuperview];
    [_verityBtn removeFromSuperview];
    [label removeFromSuperview];
    [line2 removeFromSuperview];
    
    CGRect frame = CGRectMake(20, CGRectGetMaxY(_passTF.frame)+10, (ScreenWidth-40)/3*2, 40);
    _verityTF = [[UITextField alloc] initWithFrame:frame];
    _verityTF.placeholder = @"请输入验证码";
    // _verityTF.borderStyle = UITextBorderStyleRoundedRect;
    _verityTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _verityTF.delegate = self;
    _verityTF.returnKeyType = UIReturnKeyContinue;
    [self.view addSubview:_verityTF];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    label.text = @"验证码";
    label.font = [UIFont systemFontOfSize:16];
    _verityTF.leftView = label;
    _verityTF.leftViewMode = UITextFieldViewModeAlways;
    
    
    frame = CGRectMake(CGRectGetMaxX(_verityTF.frame), CGRectGetMaxY(_passTF.frame)+10, (ScreenWidth-40)/3, 40);
    _verityBtn = [[UIButton alloc] initWithFrame:frame];
    NSData * data = [[NSData alloc] initWithBase64EncodedString:base64 options:NSUTF8StringEncoding];
    [_verityBtn setImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
    [_verityBtn addTarget:self action:@selector(verityAction:) forControlEvents:UIControlEventTouchUpInside];
    [_verityBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:_verityBtn];
    
    frame = CGRectMake(10, CGRectGetMaxY(_verityTF.frame)+4, ScreenWidth, 1);
    line2 = [[UIView alloc] initWithFrame:frame];
    line2.backgroundColor = [UIColor colorWithWhite:0.827 alpha:1.000];
    [self.view addSubview:line2];
    
    
    _passTF.returnKeyType = UIReturnKeyNext;
    
    if (_loginBtn.frame.origin.y==CGRectGetMaxY(_passTF.frame)+30) {
        
        CGRect bounds = _loginBtn.frame;
        bounds.origin.y +=50;
        _loginBtn.frame = bounds;
        
        CGRect boundss = _registerBtn.frame;
        boundss.origin.y +=50;
        _registerBtn.frame = boundss;
        
        CGRect boundsss = _findBtn.frame;
        boundsss.origin.y +=50;
        _findBtn.frame = boundsss;
    }
    
}



-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledChanged:) name:UITextFieldTextDidChangeNotification object:nil];
    
    
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden =YES;
}


-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    self.navigationController.navigationBar.hidden =NO;
    
    NSLog(@"  delloc  ");
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
