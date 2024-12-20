//
//  Card.h
//  appJuegoCartas
//
//  Created by Guest User on 16/12/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic,getter=isChosen) bool chosen;

@property (nonatomic,getter=isMatched) bool matched;


-(int) match: (NSArray *) otherCards;





@end

NS_ASSUME_NONNULL_END
