--tsevah testing
--print(1|2)--3	--opperation for mixing colors
--print(1&3)--1	---opperation for checking what colors an object has in common
--print(3&1)
--(1|3)=3	0011
--(1&3)=1	0001
--(1~3)=2	0010
--red 		    0001        --1					roygbiv
--orange        0011--      --
--yellow 		0010        --
--green         0110--      --
--blue			0100        --
--violet        0101--      --
--grey          0111--      --
function init_map(map_data)
    --load map
    --check the size of the map
    local max_x=0; max_y=0
    for x=0,29 do
        if map_data:get(x,0)~=0
            then
            if x>max_x then max_x=x end
        end
    end
    for y=0,16 do
        if map_data:get(0,y)~=0
            then
            if y>max_y then max_y=y end
        end
    end
    test=0
    --map_data:set(2,2,5)
    for x=0,max_x do
        for y=0,max_y do
            local a=map_data:get(x,y)
            if a==floor
                then
                --map_data:set(x,y,wall)
            end
            if a>=1 and a<=16   --player is setup here
                then                        --object={s={0},x={0},y={0},d={0},pol={0},c={0}}
                object.s[1]=a
                object.x[1]=x*16
                object.y[1]=y*16
                --object.d[1]       --no need to set this
                if a>=1 and a<=8
                    then
                    object.pol[1]=(1)
                end
                if a>=9 and a<=16
                    then
                    object.pol[1]=(-1)
                end
                object.c[1]=get_spr(a):get(2,2)     --sprite_data:pget(x,y)....basically
                map_data:set(x,y,floor)
            end
            --[[ if a>=17 and a<=32   --player is setup here
                then                        --object={s={0},x={0},y={0},d={0},pol={0},c={0}}
                object.s[#object.s+1]=a
                object.x[#object.s+1]=x*16
                object.y[#object.s+1]=y*16
                --object.d[1]       --no need to set this
                if a>=17 and a<=24
                    then
                    object.pol[#object.s+1]=(1)
                end
                if a>=25 and a<=32
                    then
                    object.pol[#object.s+1]=(-1)
                end
                object.c[#object.s+1]=get_spr(a):get(2,2)     --sprite_data:pget(x,y)....basically
                map_data:set(x,y,floor)
            end ]]
        end
    end
    return map_data
end

function move_objects()
    local spd=1
    
    if btnp(0) and moving==false then moving=true object.d[1]=0 end
    if btnp(1) and moving==false then moving=true object.d[1]=1 end
    if btnp(2) and moving==false then moving=true object.d[1]=2 end
    if btnp(3) and moving==false then moving=true object.d[1]=3 end
    if moving==true
        then
        if object.d[1]==0 then object.x[1]-=spd end
        if object.d[1]==1 then object.x[1]+=spd end
        if object.d[1]==2 then object.y[1]-=spd end
        if object.d[1]==3 then object.y[1]+=spd end
        moving_cnt+=spd
        if moving_cnt==16 then moving_cnt=0 moving=false end
        --move_blocks
        
    end
end

function color_mixing(a,b)
	--do later...
end

function _init()
test=0  --<<<<<<----------------------------------------------------------------------
    --plyr={s=unpod("b64:bHo0AEsAAABgAAAA-x9weHUAQyAQEARAVnAWVxZABpcGIAY3NjcGEAYXFjcWFwYABicGVwYnFhcGdwYXBgAAAR4AIwYALgAREDwAsCAGlwZAFlcWcFZA"),x=32,y=32,cnt=0,move=false,d=0}
    
    maps={
        --holding spot for currently loaded map
        unpod("b64:bHo0ACMAAAAWAQAA-wl1c2VyZGF0YSgiaTE2Iiw4LDgsIjAwM2IEAOZQMDNiIik="),
        --basics
        unpod("b64:bHo0AIEAAAAWAQAA-wl1c2VyZGF0YSgiaTE2Iiw4LDgsIjAwM2YEABATZAQAEjIEAGoxMjAwMjIgACMwMSAAmjkwMDI0MDAxYyAAAAQAZzFlMDAzNAQABCAAFmUEACIxMjwAJzIzIAATMxwAEzQIAFdlMDAyNSAAAGwAEjUcAAkEAB9mBAAKUDAzZiIp"),
        --testing
        unpod("b64:bHo0AIoAAAAWAQAA-w11c2VyZGF0YSgiaTE2Iiw4LDgsIjAwM2IwMDNmBAALojIyMDAzZDAwMzIEACMxMhQABCQAEmQQAAEUAJo5MDAyNDAwMWMgAAAEACMxZSQAEzQEAAQgABZlBAAEXAAnMjIgABMzHAATNAgAG2UgAABsABI1FAAbMkAALzIyFAADgDNmMDAzZiIp"),
        unpod("b64:bHo0AE0AAABWAAAA8yF1c2VyZGF0YSgiaTE2Iiw0LDQsIjAwMDEwMDMyMDAzOTAwMjQwMDNkMDAxZTAwMzQEABJlBABjMTIwMDFjDACwNDAwM2UwMDFlIik=")
    }
    level=1
    clr={7,8,9,10,11,12,18,5}   --roygbv grey
    floor=62
    wall=63
    object={s={0},x={0},y={0},d={0},pol={0},c={0}}      --player is at i=1
    moving=false
    moving_cnt=0
    maps[1]=init_map(maps[level+1])
end

function _draw()
    cls()
    map(maps[1])
    spr(object.s[1],object.x[1],object.y[1])
    --print(mget(plyr.x>>4,plyr.y>>4),16,16)
    print(object.c[1],200,8,9)
    
end

function _update()
    move_objects()
end

--the negative block dictates all collisions unless it collides with another negative block. Xf is based on the Vo of -
