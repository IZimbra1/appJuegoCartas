//
//  Card.m
//  appJuegoCartas
//
//  Created by Guest User on 16/12/24.
//

#import "Card.h"

@implementation Card

-(int)match:(NSArray *)otherCards{
    int score = 0;
    for (Card *card in otherCards){
        if ([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    
    return score;
}

@end
