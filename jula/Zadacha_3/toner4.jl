using HorizonSideRobots

r=Robot(animate=true)

function stairs!(r::Robot) #Главная функция
    movements!(r,Sud)
    movements!(r,West)
    #Мы в левом нижнем углу

    
    side = Ost
    num_hor = moves!(r,side) #идем вправо и запоминаем длину первой ступени
    movements!(r,West) #возвращаемся в левый угол
    mark_up!(r,num_hor) #идем в доль строки и ставим маркеры, уменьшая с каждой итерацией первоначальную длину строки
end

function mark_up!(r::Robot,size::Int)
    i = 0
    while (1 <= size) #пока длина != 0
        for _ in 1:size #движемся на длину строки и ставим маркеры
            move!(r,Ost)
            putmarker!(r)
        end
        if (isborder(r,West) == false) #если , вдруг, маркеры не поставились, поставили опять
            movements!(r,West)
            putmarker!(r)
        end
        if (isborder(r,Nord) == false) #переходим на строчку выше и уменьшаем длину строки
        move!(r,Nord)
        size = size - 1
        else
            break
        end
    end
end

function movements!(r::Robot,side::HorizonSide) #Движение до преграды
    while isborder(r,side) == false
        move!(r,side)
    end
end

back_movements!(r::Robot,side::HorizonSide,num_steps::Int) = #Движ
    for _ in 1:num_steps
        move!(r,side)
end

stairs!(r)