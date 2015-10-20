//
//  main.m
//  reboot
//
//  Created by DaChui on 10/20/15.
//  Copyright (c) 2015 com.apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "NSTask.h"

int main(int argc, char * argv[]) {
    seteuid(0);
    setgid(0);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"call NSTask");
        NSTask *task;
        task = [[NSTask alloc ]init];
        [task setLaunchPath:@"/sbin/halt"];
        [task launch];
        
        NSLog(@"call /bin/ls);");
        system("/sbin/reboot");
    });
    
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
