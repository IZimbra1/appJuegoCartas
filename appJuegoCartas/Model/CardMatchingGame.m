//
//  CardMatchingGame.m
//  appJuegoCartas
//
//  Created by Guest User on 16/12/24.
//

#import "CardMatchingGame.h"


@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic, readwrite) BOOL gameOver;

@end


@implementation CardMatchingGame

-(NSMutableArray *)cards{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}


-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    
    if(self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
        self.gameOver = NO; // Juego no terminado al principio
    }
    
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index{
    return (index<[self.cards count]) ? self.cards[index] : nil;
}


static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 0;


static const int WINNING_SCORE = 10; // Puntaje necesario para ganar

-(void)chooseCardAtIndex:(NSUInteger)index {
    if (self.gameOver) {
        return; // Si el juego ya está terminado, no hacer nada
    }

    Card *card = [self cardAtIndex:index];

    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            // Compara la carta con las otras
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break; // Solo se pueden elegir dos cartas por el momento
                }
            }

            card.chosen = YES;
            self.score -= COST_TO_CHOOSE;
        }
    }

  
    if (self.score <= -15) {
        self.gameOver = YES;
        NSLog(@"¡El juego ha terminado! Has alcanzado -30 puntos.");
    }

 
    if (self.score >= WINNING_SCORE) {
        self.gameOver = YES; 
        NSLog(@"¡Felicidades! Has alcanzado el puntaje máximo de 30 puntos.");
    }
}

-(void)restartGame {
    self.score = 0;
    
    
    [self.cards removeAllObjects];
    
    Deck *deck = [[Deck alloc] init];
    for(int i = 0; i < [self.cards count]; i++){
        Card *card = [deck drawRandomCard];
        if(card){
            [self.cards addObject:card];
        }
    }
}



@end
