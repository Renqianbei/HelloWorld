//
//  KPErWeiMaView.m
//  BKaoPush
//
//  Created by Jincang Lu on 2016/10/30.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPErWeiMaView.h"


@implementation KPErWeiMaView

- (instancetype)initWithFrame:(CGRect)frame info:(NSString *)info
{
    if ([super initWithFrame:frame]) {
        
        self.backgroundColor =[[UIColor blackColor] colorWithAlphaComponent:0.5];
        [self createUI:info];
        
    }
    
    return self;
}


- (void) createUI:(NSString *)info{

    //小背景
    UIView * bgView =[[UIView alloc] initWithFrame:CGRectMake(ScreenWidth*0.15, (ScreenHeight-ScreenWidth*0.7)*0.35, ScreenWidth*0.7, ScreenWidth*0.7)];
    bgView.backgroundColor =[UIColor whiteColor];
    [self addSubview:bgView];
    bgView.layer.cornerRadius =8;
    bgView.clipsToBounds =YES;
    
    
    UIImageView *imageView =[[UIImageView alloc] initWithFrame:CGRectMake(ViewWidth(bgView)*0.2, ViewWidth(bgView)*0.05,ViewWidth(bgView)*0.6, ViewWidth(bgView)*0.6)];
    //imageView.backgroundColor =[UIColor redColor];
    [bgView addSubview:imageView];
    
    UILabel *label =[[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), ViewWidth(bgView), ViewWidth(bgView)*0.15)];
    label.text =@"扫码关注,享各种福利";
    label.textAlignment =NSTextAlignmentCenter;
    label.font =MM_FONT;
    [bgView addSubview:label];
    
    
    UIView *line =[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame), ViewWidth(bgView), 1)];
    line.backgroundColor =[UIColor grayColor];
    [bgView addSubview:line];
    
    
    self.closeBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    self.closeBtn.frame =CGRectMake(0, CGRectGetMaxY(line.frame), ViewWidth(bgView), ViewWidth(bgView)*0.2);
    [self.closeBtn setTitle:@"关 闭" forState:UIControlStateNormal];
    [self.closeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [bgView addSubview:self.closeBtn];
    [self.closeBtn addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    
    // 1.创建滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    // 2.还原滤镜默认属性
    [filter setDefaults];
    
    // 3.设置需要生成二维码的数据到滤镜中
    // OC中要求设置的是一个二进制数据
    NSData *data = [@"kaopu" dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"InputMessage"];
    
    // 4.从滤镜从取出生成好的二维码图片
    CIImage *ciImage = [filter outputImage];
    
    imageView.image = [self createNonInterpolatedUIImageFormCIImage:ciImage size: 500];
    

}



- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)ciImage size:(CGFloat)widthAndHeight
{
    CGRect extentRect = CGRectIntegral(ciImage.extent);
    CGFloat scale = MIN(widthAndHeight / CGRectGetWidth(extentRect), widthAndHeight / CGRectGetHeight(extentRect));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extentRect) * scale;
    size_t height = CGRectGetHeight(extentRect) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CGImageRef bitmapImage = [context createCGImage:ciImage fromRect:extentRect];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extentRect, bitmapImage);
    
    // 保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    
    return [UIImage imageWithCGImage:scaledImage]; // 黑白图片
//    UIImage *newImage = [UIImage imageWithCGImage:scaledImage];
//    return [self imageBlackToTransparent:newImage withRed:200.0f andGreen:70.0f andBlue:189.0f];
}


void ProviderReleaseData (void *info, const void *data, size_t size){
    free((void*)data);
}

- (UIImage*)imageBlackToTransparent:(UIImage*)image withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue{
    const int imageWidth = image.size.width;
    const int imageHeight = image.size.height;
    size_t      bytesPerRow = imageWidth * 4;
    uint32_t* rgbImageBuf = (uint32_t*)malloc(bytesPerRow * imageHeight);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpace,
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
    // 遍历像素
    int pixelNum = imageWidth * imageHeight;
    uint32_t* pCurPtr = rgbImageBuf;
    for (int i = 0; i < pixelNum; i++, pCurPtr++){
        if ((*pCurPtr & 0xFFFFFF00) < 0x99999900)    // 将白色变成透明
        {
            // 改成下面的代码，会将图片转成想要的颜色
            uint8_t* ptr = (uint8_t*)pCurPtr;
            ptr[3] = red; //0~255
            ptr[2] = green;
            ptr[1] = blue;
        }
        else
        {
            uint8_t* ptr = (uint8_t*)pCurPtr;
            ptr[0] = 0;
        }
    }
    // 输出图片
    CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight, ProviderReleaseData);
    CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight, 8, 32, bytesPerRow, colorSpace,
                                        kCGImageAlphaLast | kCGBitmapByteOrder32Little, dataProvider,
                                        NULL, true, kCGRenderingIntentDefault);
    CGDataProviderRelease(dataProvider);
    UIImage* resultUIImage = [UIImage imageWithCGImage:imageRef];
    // 清理空间
    CGImageRelease(imageRef);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return resultUIImage;
}


- (void) closeAction:(UIButton *) button{

    [self.delegate closeView:button];
}



@end
