//
//  TWSpringyFlowLayout.h
//
//  Created by Terry Worona on 8/15/13.
//  Copyright (c) 2013 Terry Worona. All rights reserved.
//

//TWCollectionViewLayout *flowLayout = [[TWCollectionViewLayout alloc]init];
//UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];

#import <UIKit/UIKit.h>

@interface TWCollectionViewLayout : UICollectionViewFlowLayout
@property (nonatomic,retain) UIDynamicAnimator *dynamicAnimator;
- (void)collectionViewUpdates;
@end

@interface UICollectionView (TWCollectionViewLayout)
@end
