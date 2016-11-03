
//
//  KPRequestURL.h
//  BKaoPush
//
//  Created by Jincang Lu on 2016/10/31.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#ifndef KPRequestURL_h
#define KPRequestURL_h


//http://网络地址存放处

#define   ROOT_POST_URL           @"http://114.55.235.5:8888/kaopu/kpAPI.do?"
#define   ROOT_URL                @"http://114.55.235.5:8888/kaopu/kpAPI.do?method=exec&"
#define   GOODS_WEB_URL           @"http://114.55.235.5:8888/kaopu/client/view/prod/detail.html"



//短信登录获取验证码
#define SNS_VERITFY_URL           @"%@m=home&s=apib-userGetLoginMsgCode&phone=%@&_token=%@&imeiCode=%@"



//个人中心首页
#define PERSON_URL                @"%@m=home&s=apib-userPersonalCenter&userId=%@&_token=%@&imeiCode=%@"


//首页 设置营业状态的
#define SY_TIME_URL               @"%@m=home&s=apib-userSetOpenClose&id=%@&status=%ld&_token=%@&imeiCode=%@"



#endif /* KPRequestURL_h */
