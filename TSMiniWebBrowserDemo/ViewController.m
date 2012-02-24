//
//  ViewController.m
//  TSMiniWebBrowserDemo
//
//  Created by Toni Sala Echaurren on 17/01/12.
//  Copyright 2012 Toni Sala. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)buttonTouchUp:(id)sender {
    TSMiniWebBrowser *webBrowser = [[TSMiniWebBrowser alloc] initWithUrl:[NSURL URLWithString:@"http://indiedevstories.com"]];
    webBrowser.delegate = self;
//    webBrowser.showURLStringOnActionSheetTitle = YES;
//    webBrowser.showPageTitleOnTitleBar = YES;
//    webBrowser.showActionButton = YES;
//    webBrowser.showReloadButton = YES;
//    [webBrowser setFixedTitleBarText:@"Test Title Text"]; // This has priority over "showPageTitleOnTitleBar".
    webBrowser.mode = TSMiniWebBrowserModeNavigation;
    
    webBrowser.barStyle = UIBarStyleBlack;
    
    if (webBrowser.mode == TSMiniWebBrowserModeModal) {
        webBrowser.modalDismissButtonTitle = @"Home";
        [self presentModalViewController:webBrowser animated:YES];
    } else if(webBrowser.mode == TSMiniWebBrowserModeNavigation) {
        [self.navigationController pushViewController:webBrowser animated:YES];
    }
}

#pragma mark - TSMiniWebBrowserDelegate

-(void) tsMiniWebBrowserDidDismiss {
    NSLog(@"TSMiniWebBrowser was dismissed");
}

@end
