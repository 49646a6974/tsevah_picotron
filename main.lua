--tsevah
--print(1|2)--3	--opperation for mixing colors
--print(1&3)--1	---opperation for checking what colors an object has in common
--print(3&1)
--(1|3)=3	0011
--(1&3)=1	0001
--(1~3)=2	0010
--red 		0001					roygbiv
--yellow 		0010
--blue			0100
function move_player()
    local spd=1
    
    if btnp(0) and plyr.move==false then plyr.move=true plyr.d=0 end
    if btnp(1) and plyr.move==false then plyr.move=true plyr.d=1 end
    if btnp(2) and plyr.move==false then plyr.move=true plyr.d=2 end
    if btnp(3) and plyr.move==false then plyr.move=true plyr.d=3 end
    if plyr.move==true
        then
        if plyr.d==0 then plyr.x-=spd end
        if plyr.d==1 then plyr.x+=spd end
        if plyr.d==2 then plyr.y-=spd end
        if plyr.d==3 then plyr.y+=spd end
        plyr.cnt+=spd
        if plyr.cnt==16 then plyr.cnt=0 plyr.move=false end
    end
end

function color_mixing(a,b)
	--do later...
end

function _init()
    plyr={s=unpod("b64:bHo0AEsAAABgAAAA-x9weHUAQyAQEARAVnAWVxZABpcGIAY3NjcGEAYXFjcWFwYABicGVwYnFhcGdwYXBgAAAR4AIwYALgAREDwAsCAGlwZAFlcWcFZA"),x=32,y=32,cnt=0,move=false,d=0}
end

function _draw()
    cls()
    spr(plyr.s,plyr.x,plyr.y)
end

function _update()
    move_player()
end
