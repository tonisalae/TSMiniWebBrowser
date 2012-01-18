## TSMiniWebBrowser - In-App web browser control for iPhone apps

There are already some solutions to this problem out there but non of them offers this features. First, this solution solves the well-known **UIWebView bug** that causes erratic behavior when combining "zooming operations" and "landscape orientation". Moreover, the solution presented is **highly customizable**.

More about me at [IndieDevStories.com](http://indiedevstories.com)

![image](http://indiedevstories.files.wordpress.com/2012/01/tsminiwebbrowser.png)

## Features

TSMiniWebBrowser offers the following **features**:

* Back and forward buttons
* Reload button (*optional*)
* Activity indicator while page is loading
* Action button to open the current page in Safari (*optional*)
* Displays the page title at the navigation bar (*optional*)
* Displays the current URL at the top of the “Open in Safari” action sheet (*optional*)
* Customizable bar style: default, black, black translucent.

As you can see, there are some items that are “optional”. That means that you can configure the browser to display or not those items, depending on your app needs.

Moreover, TSMiniWebBrowser **supports 2 presentation modes**:

* **Navigation controller mode**. Using this mode you can push the browser to your navigation controller.
* **Modal mode**. Using this mode you can present the browser modally. A title bar with a dismiss button will be automatically added.

## Usage

If you are OK with the **TSMiniWebBrowser defaults**, you can simply use this snippet to create and display the browser:

	TSMiniWebBrowser *webBrowser = [[TSMiniWebBrowser alloc] initWithUrl:[NSURL URLWithString:@"http://indiedevstories.com"]];
	[self.navigationController pushViewController:webBrowser animated:YES];

If you prefer, you may **customize** the browser behavior. There is also a **simple Demo app** within the project.

	TSMiniWebBrowser *webBrowser = [[TSMiniWebBrowser alloc] initWithUrl:[NSURL URLWithString:@"http://indiedevstories.com"]];
    webBrowser.showURLStringOnActionSheetTitle = YES;
    webBrowser.showPageTitleOnTitleBar = YES;
    webBrowser.showActionButton = YES;
    webBrowser.showReloadButton = YES;
    webBrowser.isModal = NO;

    webBrowser.barStyle = UIBarStyleBlack;

    if (webBrowser.isModal) {
        [self presentModalViewController:webBrowser animated:YES];
    } else {
        [self.navigationController pushViewController:webBrowser animated:YES];
    }

As usual, very easy to use ;)

## Adding TSMiniWebBrowser into your Xcode 4 project

To add the TSMiniWebBrowser component to your project you simply need to drag & drop the entire “TSMiniWebBrowser” folder. There are only two files, apart from the icon images.

This project uses **ARC**.

## Licence

Copyright (c) 2012 Toni Sala

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.