//
//  AHTestTableViewCell.m
//  iOSShadow
//
//  Created by gx on 2021/1/23.
//

#import "AHTestTableViewCell.h"


@interface AHTestTableViewCell ()

@property (nonatomic,strong) UIView *shadow1View;

@property (nonatomic,strong) UIView *shadow2View;

@property (nonatomic,strong) UIImageView *imageV;



@end

@implementation AHTestTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createSubViews];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
//    CFAbsoluteTime t = CFAbsoluteTimeGetCurrent();
//    for (int i = 0; i < 8000; i++) {
//        NSString *str = [NSString stringWithFormat:@"fdasfjldsjkflsas"];
//        str = [NSString stringWithFormat:@"321321312"];
//        self.titleLabel.text = str;
//        [self.titleLabel sizeToFit];
//    }
//    NSLog(@"%f",CFAbsoluteTimeGetCurrent()-t);
}

- (void)createSubViews{
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.shadow1View];
    [self.contentView addSubview:self.shadow2View];
    [self.contentView addSubview:self.imageV];
}

- (void)setImg:(UIImage *)img{
    self.imageV.image = img;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UIView *)shadow1View{
    
    if (_shadow1View == nil) {
        _shadow1View = [[UIView alloc] initWithFrame:CGRectMake(50, 12, 100, 20)];
        _shadow1View.backgroundColor = [self randomColor];
        _shadow1View.layer.shadowColor = [self randomColor].CGColor;
        _shadow1View.layer.shadowOffset = CGSizeMake(2, 2);
        _shadow1View.layer.cornerRadius = 4.0;
        _shadow1View.layer.shadowRadius = 4.0;
        _shadow1View.layer.shadowOpacity = 0.7;
//        _shadow1View.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 20) cornerRadius:4.0].CGPath;
        
    }
    return _shadow1View;
}

- (UIView *)shadow2View{
    if (_shadow2View == nil) {
        _shadow2View = [[UIView alloc] initWithFrame:CGRectMake(self.shadow1View.frame.origin.x + self.shadow1View.frame.size.width + 40, 12, 140, 20)];
        _shadow2View.backgroundColor = [self randomColor];
        _shadow2View.layer.shadowColor = [self randomColor].CGColor;
        _shadow2View.layer.shadowOffset = CGSizeMake(2, 2);
        _shadow2View.layer.cornerRadius = 4.0;
        _shadow2View.layer.shadowRadius = 4.0;
        _shadow2View.layer.shadowOpacity = 0.7;
//        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:_shadow2View.bounds cornerRadius:4.0];
//        _shadow2View.layer.shadowPath = path.CGPath;
        
    }
    return _shadow2View;
}

- (UIImageView *)imageV{
    if (_imageV == nil) {
        _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(self.shadow2View.frame.origin.x + self.shadow2View.frame.size.width + 20, 12, 20, 20)];
        _imageV.image = [self imageWithColor:[self randomColor]];
        _imageV.layer.cornerRadius = 10.;
        if (@available(iOS 13.0, *)) {
            _imageV.layer.cornerCurve = kCACornerCurveContinuous;
        } else {
            // Fallback on earlier versions
        }
        _imageV.layer.masksToBounds = YES;
        
//        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//        shapeLayer.frame = CGRectMake(0, 0, 20, 20);
//        shapeLayer.backgroundColor = [UIColor blackColor].CGColor;
//        shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 20, 20) cornerRadius:4].CGPath;
//        _imageV.layer.mask = shapeLayer;
        
//        if (@available(iOS 13.0, *)) {
//            _imageV.layer.cornerCurve = kCACornerCurveContinuous;
//        } else {
//            // Fallback on earlier versions
//        }
    }
    return _imageV;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 12, 40, 20)];
    }
    return _titleLabel;
}

- (UIColor *)randomColor{
    CGFloat red = arc4random_uniform(256)/ 255.0;
    CGFloat green = arc4random_uniform(256)/ 255.0;
    CGFloat blue = arc4random_uniform(256)/ 255.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];

    return color;
}
    

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


    
@end
