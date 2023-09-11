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

    VideeoConfig *config = [[VideeoConfig alloc] initWithShopID:@"jaredvideeo"
                                                         locale:@"en"
                                                       currency:@"usd"
                                                    environment:VideeoEnvironmentTest
                                 allowsPictureInPicturePlayback:YES
                                                 showCartButton:YES];

    VideeoUser *user = [[VideeoUser alloc] initWithFirstName:@"Jared"
                                                    lastName:@"Green"
                                                  profileURL:@"https://picsum.photos/200"
                                                  facebookId:@"123"
                                                 instagramId:nil
                                                    tiktokId:nil];
   
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
    [alertVC addAction:[UIAlertAction actionWithTitle:@"Watch" style:UIAlertActionStyleDefault  handler:^(UIAlertAction *action){
        [self showLive: nil];
    }]];
    
    [self presentViewController:alertVC animated:true completion:nil];
    
}

- (IBAction)showLive:(id)sender {
    NSError *error;
    UIViewController *vc = [[VideeoManager instance] getLiveStreamViewControllerWithDelegate:self error:&error];

    if (error == nil) {
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:vc animated:true completion:nil];
    } else {
        NSLog(@"%@", error.localizedDescription);
    }
}

- (IBAction)showReplays:(id)sender {
    //TODO: How do we handle replays now that the Videeo SDK does not include any replay UI?
}

- (void)productTappedWithProduct:(id<VideeoProduct> _Nonnull)product presenter:(id<ProductPresenter> _Nonnull)presenter {}

- (void)cartTappedWithPresenter:(id<CartPresenter> _Nonnull)presenter {}

- (UIViewController * _Nullable)cartTapped {
    return nil;
}

- (void)close {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)userAuthenticationRequired {}

- (BOOL)streamEnded {
    return false;
}

- (BOOL)userRemovedFromLive {
    return false;
}

@end
