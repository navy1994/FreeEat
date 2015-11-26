//
//  AppDelegate.h
//  FreeEat
//
//  Created by mac- t4 on 15/11/25.
//  Copyright (c) 2015年 上海科文麦格里实业有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <HKSlideMenu3DController.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic)  HKSlideMenu3DController *slideMenuVC;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (AppDelegate *)mainDelegate;
- (void)ChageViewController:(NSIndexPath *)indexPath;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

