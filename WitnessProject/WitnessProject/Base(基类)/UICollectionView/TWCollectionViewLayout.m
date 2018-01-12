//
//  TWSpringyFlowLayout.m
//
//  Created by Terry Worona on 8/15/13.
//  Copyright (c) 2013 Terry Worona. All rights reserved.
//

#import "TWCollectionViewLayout.h"
#import <objc/runtime.h>

#define kTWSpringyFlowLayoutDefaultBounce 1600.0f

@implementation UICollectionView (TWCollectionViewLayout)
+ (void)load{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		Method reloadData = class_getInstanceMethod(self, @selector(reloadData));
		Method _reloadData = class_getInstanceMethod(self, @selector(_reloadData));
		method_exchangeImplementations(reloadData, _reloadData);
	});
}
- (void)_reloadData{
	[self _reloadData];
	TWCollectionViewLayout *collectionViewLayout = (TWCollectionViewLayout*)self.collectionViewLayout;
	if (![collectionViewLayout isKindOfClass:[TWCollectionViewLayout class]]) return;
	if ([collectionViewLayout respondsToSelector:@selector(dynamicAnimator)]) {
		[collectionViewLayout.dynamicAnimator removeAllBehaviors];
		collectionViewLayout.dynamicAnimator = nil;
		[collectionViewLayout collectionViewUpdates];
	}
}
@end

@interface TWCollectionViewLayout (){
	CGFloat _bounceFactor;
}
@end

@implementation TWCollectionViewLayout

#pragma mark - Init
- (id)init{
	return [self initWithBounceFactor:kTWSpringyFlowLayoutDefaultBounce];
}
// Lower the number, bigger the bounce.
// 0 = crazy bounce bounce, 1000 = minimum bounce
- (id)initWithBounceFactor:(CGFloat)bounceFactor{
	self = [super init];
	if (self) {
		_bounceFactor = bounceFactor;
	}
	return self;
}
- (void)prepareLayout{
	[super prepareLayout];
	[self collectionViewUpdates];
}
- (void)collectionViewUpdates{
	if (!_dynamicAnimator) {
		_dynamicAnimator = [[UIDynamicAnimator alloc] initWithCollectionViewLayout:self];
		CGSize contentSize = [self collectionViewContentSize];
		NSArray *items = [super layoutAttributesForElementsInRect:CGRectMake(0, 0, contentSize.width, contentSize.height)];
		for (UICollectionViewLayoutAttributes *item in items) {
			UIAttachmentBehavior *spring = [[UIAttachmentBehavior alloc] initWithItem:item attachedToAnchor:[item center]];
			spring.length = 0;
			spring.damping = 0.5;
			spring.frequency = 0.8;
			[_dynamicAnimator addBehavior:spring];
		}
	}
}

#pragma mark - Layout
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
	return [_dynamicAnimator itemsInRect:rect];
}
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
	return [_dynamicAnimator layoutAttributesForCellAtIndexPath:indexPath];
}
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
	UIScrollView *scrollView = self.collectionView;
	CGFloat scrollDelta = newBounds.origin.y - scrollView.bounds.origin.y;
	CGPoint touchLocation = [scrollView.panGestureRecognizer locationInView:scrollView];
	for (UIAttachmentBehavior *spring in _dynamicAnimator.behaviors) {
		CGPoint anchorPoint = spring.anchorPoint;
		CGFloat distanceFromTouch = fabs(touchLocation.y - anchorPoint.y);
		CGFloat scrollResistance = distanceFromTouch / _bounceFactor; // higher the number, larger the bounce
		UICollectionViewLayoutAttributes *item = (UICollectionViewLayoutAttributes*)[spring.items firstObject];
		CGPoint center = item.center;
		center.y += scrollDelta * scrollResistance;
		item.center = center;
		[_dynamicAnimator updateItemUsingCurrentState:item];
	}
	return YES;
}

@end
