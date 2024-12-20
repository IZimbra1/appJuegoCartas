//
//  ViewController.m
//  appJuegoCartas
//
//  Created by Guest User on 16/12/24.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) Deck *deck;
@property (strong,nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButton;

@property (weak, nonatomic) IBOutlet UILabel *labelPuntaje;








@end

@implementation ViewController

-(CardMatchingGame *)game{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount: [self.cardButton count]
                                                          usingDeck:[self createDeck]];
    
    return _game;
}





-(Deck *) createDeck{
    return  [[PlayingCardDeck alloc]init];
}


- (IBAction)tocarBotonCarta:(UIButton *)sender {
    

    int chosenButtonIndex = [self.cardButton indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
    
   
}
-(void)updateUI {
    for (UIButton *cardButton in self.cardButton){
        int cardButtonIndex = [self.cardButton indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.labelPuntaje.text = [NSString stringWithFormat:@"Puntuacion: %d", self.game.score];
    }
    
    
    
}
- (IBAction)reinicioBoton:(UIButton *)sender {
    self.game = nil; // Reinicia el juego
      [self updateUI]; // Actualiza la interfaz de usuario
}


-(NSString *)titleForCard: (Card *)card{
    return  card.isChosen ? card.contents: @"";
}


-(UIImage *)backgroundImageForCard:(Card *)card{
    return  [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}



@end
