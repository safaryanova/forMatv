from pygame import *
window = display.set_mode((700, 500))
display.set_caption('ИГРА Лабиринт')
run = True



class GameSprite(sprite.Sprite):
    def __init__(self,picture,w,h,x,y):#не хватало нижних подчеркиваний:(
        sprite.Sprite.__init__(self)#сейм
        self.image=transform.scale(image.load(picture),(w,h))
        self.rect = self.image.get_rect()
        self.rect.x=x
        self.rect.y=y
    def reset(self):
        window.blit(self.image,(self.rect.x,self.rect.y))
wall_1 = GameSprite('1.png',700,500,0,0)
wall_2 = GameSprite('1.png', 800, 10, 30, 15)
wall_4 = GameSprite('1.png', 325, 10, 15, 120)
wall_5 = GameSprite('1.png', 800, 10, 30, 470)
wall_3 = GameSprite('1.png', 10, 275, 530, 90)
wall_6 = GameSprite('1.png', 10, 275, 340, 230)
wall_7 = GameSprite('1.png', 10,570, 30, -25 )


class Player(GameSprite):
    #когда Матвей не ставит нижние подчеркивания перед и после init в мире грустит одна Альбина
    def __init__(self,picture,wigth,height,x,y,x_speed,y_speed):
        GameSprite.__init__(self,picture, wigth,height,x,y)
        self.x_speed = x_speed
        self.y_speed = y_speed
        

    def update(self):
        self.rect.x += self.x_speed
        self.rect.y += self.y_speed

x_speed = 50
y_speed = 50
#player = Player(picture,wigth,height,x_speed,y_speed) как ты можешь юзать переменную picture, которой нет?
#я сразу передам картинку, можно было и исп. переменную
#player = Player('ball.png',wigth,height,x_speed,y_speed)читай выше
player = Player('2.png',50,50,5,5, 2, 2)
player_1 = Player("1.png", 100,100,50,20,50,50)
player_2 = Player('ball.png', 100, 100, 550, 350, 50, 50)
player_3 = Player('3.png', 100, 100, 50, 350, 50, 50)



while run:
    time.delay(50)
    
    for e in event.get():
        if e.type == QUIT:
            run = False
        elif e.type == KEYDOWN:
            if e.key == K_LEFT:
                player_2.x_speed = -5
            elif e.key == K_RIGHT:
                player_2.x_speed = 5
            elif e.key == K_UP:
                player_2.y_speed = -5
            elif e.key == K_DOWN:
                player_2.x_speed = 5
        elif e.type == KEYUP:
            if e.key == K_LEFT:
                player_2.x_speed = 0
            elif e.key == K_RIGHT:
                player_2.x_speed = 0
            elif e.key == K_UP:
                player_2.y_speed = 0
            elif e.key == K_DOWN:
                player_2.x_speed = 0
    wall_1.reset()
    player_1.reset()
    wall_2.reset()
    wall_4.reset()
    wall_3.reset()
    wall_5.reset()
    wall_6.reset()
    wall_7.reset()
    player_2.reset()
    player_3.reset()
    player_2.update()
    display.update()
