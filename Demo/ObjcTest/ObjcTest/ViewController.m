//
//  ViewController.m
//  ObjcTest
//
//  Created by Nicholas Della Valle on 10/24/22.
//

#import "ViewController.h"
@import VideeoSDK;

@interface ViewController () <VideeoStreamDelegate>

@property (nonatomic) UIButton *startButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.startButton.backgroundColor= [UIColor blackColor];
    [self.view addSubview:self.startButton];
    [self.startButton setTitle:@"Show Live" forState:UIControlStateNormal];
    self.startButton.frame =  CGRectMake(0, 0, 100, 50);
    self.startButton.center = self.view.center;
    [self.startButton addTarget:self action:@selector(showLive) forControlEvents:UIControlEventTouchUpInside];
    
    VideeoConfig *config = [[VideeoConfig alloc] initWithShopID:@"jaredvideeo" environment:VideeoEnvironmentStaging];
    VideeoUser *user = [[VideeoUser alloc] initWithFirstName:@"Jared" lastName:@"Green" facebookId:@"123" instagramId:nil tiktokId:nil];
    [[VideeoManager instance] initializeWithConfig:config videeoUser:user];
    
    __weak ViewController *weakSelf = self;
    [[NSNotificationCenter defaultCenter] addObserverForName:NSNotification.videeoLiveStatusChanged object:[VideeoManager instance] queue:nil usingBlock:^(NSNotification* notification){
        
        if ([notification.userInfo[@"isLive"] boolValue] == true) {
            [weakSelf alertShowLive];
        }
    }];
    
}

- (void)alertShowLive {
    
    if ([self presentedViewController] != nil) {
        return;
    }
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Watch live stream?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"Watch live stream?" style:UIAlertActionStyleDefault  handler:^(UIAlertAction *action){
        [self showLive];
    }]];
    
    [self presentViewController:alertVC animated:true completion:nil];
    
}


- (void)showLive {
    
    VideeoViewController *vc = [[VideeoManager instance] getLiveStreamViewControllerWithDelegate:self];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:true completion:nil];

}


- (BOOL)productDetailTappedWithProduct:(id<VideeoProduct> _Nonnull)product {
    return false;
}

- (BOOL)productOverlayTappedWithProduct:(id<VideeoProduct> _Nonnull)product {
    return false;
}

- (BOOL)shopButtonTappedWithCurrentProduct:(id<VideeoProduct> _Nullable)currentProduct {
    return false;
}

- (BOOL)streamEnded {
    return false;
}

- (BOOL)userRemovedFromLive {
    return false;
}




@end
