//
//  PlayingCardGame.m
//  appJuegoCartas
//
//  Created by Guest User on 16/12/24.
//

#import "PlayingCardGame.h"
#import "PlayingCard.h"

@implementation PlayingCardGame

-(instancetype)init{
    self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank  <= [PlayingCard maxRank]; rank++){
                PlayingCard *card = [[PlayingCard alloc]init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    
    return self;
}



@end
