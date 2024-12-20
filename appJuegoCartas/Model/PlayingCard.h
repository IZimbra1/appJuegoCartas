//
//  PlayingCard.h
//  appJuegoCartas
//
//  Created by Guest User on 16/12/24.
//

#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+(NSArray *) validSuits;
+(NSUInteger) maxRank;


@end

NS_ASSUME_NONNULL_END
