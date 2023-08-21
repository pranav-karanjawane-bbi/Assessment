class Human:
    def __init__(self,behaviour, hp=50, lightattack=10, darkattack=10):
        self.behaviour = behaviour
        self.hp = hp
        self.lightattack = lightattack
        self.darkattack = darkattack

class Hero(Human):
    def __init__(self, behaviour, high_iq = False):
        super().__init__(behaviour)
        if high_iq:
            self.lightattack += 5
            
class Monster(Human):
    def __init__(self, behaviour, bigbody = False):
        super().__init__(behaviour)
        if bigbody:
            self.hp += 5
            
def war(character1, character2):
    while character1.hp >0 and character2.hp >0 :
        character2.hp -= character1.lightattack
        if character2.hp <=0 :
            return character1
        character1.hp -= character2.darkattack
        if character1.hp <= 0:
            return character2
    return None
            
Heros = [
    Hero("Good", high_iq = True),
    Hero("Good"),
    Hero("Good", high_iq = True)
    ]
    
Monsters = [
    Monster("Bad"),
    Monster("Bad", bigbody = True),
    Monster("Bad")
    ]
    

for i in range(len(Heros)):
    hero = Heros[i]
    monster = Monsters[i]
    win = war(hero, monster)
    
    if win is None:
        print("Battle", i + 1, "result: it is a tie")
    elif isinstance(win, Hero):
        print("Battle", i + 1, "result: Team hero wins!")
    else:
        print("Battle", i + 1, "result: Team Monster wins!")
        print('hi')
        
        
        
        
        
