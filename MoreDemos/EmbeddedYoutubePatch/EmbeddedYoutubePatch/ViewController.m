//
//  ViewController.m
//  EmbeddedYoutubePatch
//
//  Created by Toni Sala Echaurren on 24/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize modalWebViewPresented;

#pragma mark - Embeeded Youtube video patch

/*
 * These 3 methods allow a workaround to the problem of embedded youtube videos when presented modally in a web view.
 * More details here: http://stackoverflow.com/questions/8419145/playing-youtube-video-inside-uiwebview-how-to-handle-the-done-button/9129304#9129304
 */

- (void) presentModalWebViewController:(BOOL) animated {
    // Create webViewController here.
    [self presentModalViewController:webViewController animated:animated];
    self.modalWebViewPresented = YES;
}

- (void) dismissModalWebViewController:(BOOL) animated {
    self.modalWebViewPresented = NO;
    [self dismissModalViewControllerAnimated:animated];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.modalWebViewPresented) {
        // Note: iOS thinks the previous modal view controller is displayed.
        // It must be dismissed first before a new one can be displayed.  
        // No animation is needed as the YouTube plugin already provides some.
        [self dismissModalWebViewController:NO];
        [self presentModalWebViewController:NO];
    }
}

#pragma mark - TSMiniWebBrowserDelegate

-(void) tsMiniWebBrowserDidDismiss {
    NSLog(@"browser dismissed");
    [self dismissModalWebViewController:YES]; // IMPORTANT!!!!!!
}

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

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

#pragma mark - Actions

- (IBAction)buttonTouchUp:(id)sender {
    webViewController = [[TSMiniWebBrowser alloc] initWithUrl:[NSURL URLWithString:@"http://www.xrel.to/movie/72308/Black-Gold.html#video=_KLQjS7egS4"]];
    webViewController.mode = TSMiniWebBrowserModeModal;
    webViewController.delegate = self;
    [self presentModalWebViewController:YES];
}

@end
