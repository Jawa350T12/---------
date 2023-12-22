function final!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
    else
        move!(robot, right(side))
        final!(robot, side)
        move!(robot, left(side))
    end
end

function right(side)
    return HorizonSide((Int(side)+1) % 4)
end

function left(side)
    return HorizonSide((Int(side)+3) % 4)
end

side=readline()
side=parse(Int64, side)

final!(r, HorizonSide(side))