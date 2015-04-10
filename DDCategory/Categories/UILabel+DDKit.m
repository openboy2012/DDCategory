//
//  UILabel+DDKit.m
//  DDCategory
//
//  Created by Diaoshu on 15-3-20.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import "UILabel+DDKit.h"

@implementation UILabel (DDKit)

+ (CGFloat)heightOfText:(NSString *)text fontSize:(CGFloat)fontSize constraintWidth:(CGFloat)width{
    return [self heightOfText:text fontSize:fontSize constraintWidth:width minimumHeight:0];
}

+ (CGFloat)heightOfText:(NSString *)text fontSize:(CGFloat)fontSize constraintWidth:(CGFloat)width minimumHeight:(CGFloat)height{
    UIFont *systemFont = [UIFont systemFontOfSize:fontSize];
    return [self heightOfText:text font:systemFont constraintWidth:width minimumHeight:height];
}

+ (CGFloat)heightOfText:(NSString *)text font:(UIFont *)font constraintWidth:(CGFloat)width minimumHeight:(CGFloat)height{
    CGFloat finalHeight = 0.0f;
    CGSize constrainedSize = CGSizeMake(width, CGFLOAT_MAX);
    CGSize size = CGSizeZero;
    if ([text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
        
        size = [text boundingRectWithSize:constrainedSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    }else{
        size = [text sizeWithFont:font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
    }
    finalHeight = ceilf(size.height);
    
    // check if setup minimum height and final is lower than the minimum height
    if(height > 0 && finalHeight < height){
        finalHeight = height;
    }
    return finalHeight;
}

@end

@implementation UILabel (AutoSize)

- (UILabel *)resizeLabelHorizontal{
    return [self resizeLabelHorizontal:0];
}

- (UILabel *)resizeLabelVertical{
   return [self resizeLabelVertical:0];
}

- (UILabel *)resizeLabelVertical:(CGFloat)minimumHeigh{
    CGRect newFrame = self.frame;
    CGSize constrainedSize = CGSizeMake(newFrame.size.width, CGFLOAT_MAX);
    NSString *text = self.text;
    UIFont *font = self.font;
    CGSize size = CGSizeZero;
    if ([text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
        
        size = [text boundingRectWithSize:constrainedSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    }else{
        size = [text sizeWithFont:font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
    }
    newFrame.size.height = ceilf(size.height);
    if(minimumHeigh > 0){
        newFrame.size.height = (newFrame.size.height < minimumHeigh ? minimumHeigh : newFrame.size.height);
    }
    self.frame = newFrame;
    return self;
}

- (UILabel *)resizeLabelHorizontal:(CGFloat)minimumWidth{
    CGRect newFrame = self.frame;
    CGSize constrainedSize = CGSizeMake(CGFLOAT_MAX, newFrame.size.height);
    NSString *text = self.text;
    UIFont *font = self.font;
    CGSize size = CGSizeZero;
    if ([text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
        
        size = [text boundingRectWithSize:constrainedSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    }else{
        size = [text sizeWithFont:font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
    }
    newFrame.size.width = ceilf(size.width);
    if(minimumWidth > 0){
        newFrame.size.width = (newFrame.size.width < minimumWidth ? minimumWidth: newFrame.size.width);
    }
    self.frame = newFrame;
    return self;
}

@end