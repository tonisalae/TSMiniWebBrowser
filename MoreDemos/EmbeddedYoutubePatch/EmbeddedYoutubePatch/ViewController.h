//
//  ViewController.h
//  EmbeddedYoutubePatch
//
//  Created by Toni Sala Echaurren on 24/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSMiniWebBrowser.h"

@interface ViewController : UIViewController <TSMiniWebBrowserDelegate> {
    TSMiniWebBrowser *webViewController;
}

@property (nonatomic, assign) BOOL modalWebViewPresented;

- (IBAction)buttonTouchUp:(id)sender;

@end
