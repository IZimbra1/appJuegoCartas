//
//  CardMatchingGame.h
//  appJuegoCartas
//
//  Created by Guest User on 16/12/24.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
NS_ASSUME_NONNULL_BEGIN

@interface CardMatchingGame : NSObject


-(instancetype)initWithCardCount: (NSUInteger)count
                       usingDeck: (Deck *)deck;




-(void) chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

-(void)restartGame;
@property (nonatomic, readonly) NSInteger score;

@end

NS_ASSUME_NONNULL_END
