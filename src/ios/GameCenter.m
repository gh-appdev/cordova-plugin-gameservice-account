//
//  GameCenter.m
//  Copyright (c) 2013-2015 Lee Crossley - http://ilee.co.uk
//

#import "Cordova/CDV.h"
#import "Cordova/CDVViewController.h"
#import "GameCenter.h"

@implementation GameCenter

- (void) auth:(CDVInvokedUrlCommand*)command;
{
    [self.commandDelegate runInBackground:^{

        __weak GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];

        localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error) {
            CDVPluginResult* pluginResult = nil;
            if (viewController != nil)
            {
                // Login required
                [self.viewController presentViewController:viewController animated:YES completion:nil];
            }
            else
            {
                if (localPlayer.isAuthenticated)
                {
                    NSDictionary* user = @{
                        @"alias":localPlayer.alias,
                        @"displayName":localPlayer.displayName,
                        @"playerID":localPlayer.playerID
                    };
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:user];
                }
                else if (error != nil)
                {
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                }
                else
                {
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
                }
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        };
    }];
}

- (void) gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController
{
    [gameCenterViewController dismissViewControllerAnimated:YES completion:nil];
}

@end