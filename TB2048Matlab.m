%-----------A 2048 Port--------------------%
%--------- Made by Tyler Barron -----------%
%-----------trbarron@uw.edu----------------%
%-----------tylerbarron.com----------------%


% -----------------------------------------%
% --------------START----------------------%
% -----------------------------------------%
A = zeros(4,4);
A = [8,16,128,2048;4,4,256,2;0,0,4,16;0,0,0,4]
gameover = 0;
iteration = 0;
time = clock;
rand1 = mod(floor(time(6)*10^0),4)+1;
rand2 = mod(floor(time(6)*10^1),4)+1;
rand3 = mod(floor(time(6)*10^2),4)+1;
rand4 = mod(floor(time(6)*10^3),4)+1;
rand5 = (mod(floor(time(6)*10^4),2)+1)*2;
rand6 = (mod(floor(time(6)*10^5),2)+1)*2;
A(rand1,rand2)=rand5;
A(rand3,rand4)=rand6
disp('Welcome to 2048. Press q to quit at anytime')
disp('Please use the arrow keys to move. Press a direction to start')
while gameover==0
    Aold = A;
    w = waitforbuttonpress;
    if w
           p = get(gcf, 'CurrentCharacter');
           p = double(p);
    end
    if p == 113
        gameover = 1
    end
    
    % -----------------------------------------%
    % --------------RIGHT-----------------------%
    % -----------------------------------------%
    
    if p == 29 %right
        %First we sum numbers that are alike from right to left
        for row = 1:4
            for column = 1:4
                if A(row,5-column)>0 %if the current column is non-zero
                    %Number of possible squares to the left = (5-column)-1 = 4 - column
                    for sumattempt = 1:4-column %if 0 it won't run -- so it won't break if its summing leftmost col
                        if A(row,(5-column)-sumattempt)>1
                            if A(row,(5-column)-sumattempt) == A(row,5-column)
                                A(row,5-column)=A(row,5-column)*2;
                                A(row,(5-column)-sumattempt) = 0;
                            end
                            break % no matter what if the number is nonzero we stop trying to sum it
                        end
                    end
                end
            end
        end
        %Next we are going to move over the values
        for row = 1:4
            Arow = A(row,:);
            NZArow = Arow(Arow ~= 0);
            [irrelivantVar,sizeNZArow] = size(NZArow);
            if sizeNZArow == 0 %All zeros already, do nothing
            end
            if sizeNZArow == 1 %One non-zero term. Shift right
            Arow = [0,0,0,NZArow(1)];
            end
            if sizeNZArow == 2 %Two non-zero term. Shift right
            Arow = [0,0,NZArow(1),NZArow(2)];
            end
            if sizeNZArow == 3 %Three non-zero term. Shift right
            Arow = [0,NZArow(1),NZArow(2),NZArow(3)];
            end
            if sizeNZArow == 4 %All non-zeros already, do nothing
            end
            A(row,:) = Arow;
        end
    end
    
    % -----------------------------------------%
    % --------------LEFT-----------------------%
    % -----------------------------------------%
    
    if p == 28 %left
        %First we sum numbers that are alike from right to left
        for row = 1:4
            for column = 1:4
                if A(row,column)>0 %if the current column is non-zero
                    %Number of possible squares to the left = (5-column)-1 = 4 - column
                    for sumattempt = 1:4-column %if 0 it won't run -- so it won't break if its summing leftmost col
                        if A(row,(column+sumattempt))>1
                            if A(row,(column+sumattempt)) == A(row,column)
                                A(row,column)=A(row,column)*2;
                                A(row,column+sumattempt) = 0;
                            end
                            break % no matter what if the number is nonzero we stop trying to sum it
                        end
                    end
                end
            end
        end
        %Next we are going to move over the values
        for row = 1:4
            Arow = A(row,:);
            NZArow = Arow(Arow ~= 0);
            [irrelivantVar,sizeNZArow] = size(NZArow);
            if sizeNZArow == 0 %All zeros already, do nothing
            end
            if sizeNZArow == 1 %One non-zero term. Shift right
            Arow = [NZArow(1),0,0,0,];
            end
            if sizeNZArow == 2 %Two non-zero term. Shift right
            Arow = [NZArow(1),NZArow(2),0,0];
            end
            if sizeNZArow == 3 %Three non-zero term. Shift right
            Arow = [NZArow(1),NZArow(2),NZArow(3),0];
            end
            if sizeNZArow == 4 %All non-zeros already, do nothing
            end
            A(row,:) = Arow;
        end
    end
    % -----------------------------------------%
    % --------------DOWN-----------------------%
    % -----------------------------------------%
    if p == 31 %down
        %First we sum numbers that are alike from right to left
        for column = 1:4
            for row = 1:4
                if A(5-row,column)>0 %if the current column is non-zero
                    %Number of possible squares to the left = (5-column)-1 = 4 - column
                    for sumattempt = 1:4-row %if 0 it won't run -- so it won't break if its summing leftmost col
                        if A((5-row)-sumattempt,column)>1
                            if A((5-row)-sumattempt,column) == A(5-row,column)
                                A(5-row,column)=A(5-row,column)*2;
                                A((5-row)-sumattempt,column) = 0;
                            end
                            break % no matter what if the number is nonzero we stop trying to sum it
                        end
                    end
                end
            end
        end
        %Next we are going to move over the values
        for column = 1:4
            Acol = A(:,column);
            NZAcol = Acol(Acol ~= 0);
            [sizeNZAcol,irrelivantVar] = size(NZAcol);
            if sizeNZAcol == 0 %All zeros already, do nothing
            end
            if sizeNZAcol == 1 %One non-zero term. Shift right
            Acol = [0;0;0;NZAcol(1)];
            end
            if sizeNZAcol == 2 %Two non-zero term. Shift right
            Acol = [0;0;NZAcol(1);NZAcol(2)];
            end
            if sizeNZAcol == 3 %Three non-zero term. Shift right
            Acol = [0;NZAcol(1);NZAcol(2);NZAcol(3)];
            end
            if sizeNZAcol == 4 %All non-zeros already, do nothing
            end
            A(:,column) = Acol;
        end
    end
    % -----------------------------------------%
    % --------------UP-------------------------%
    % -----------------------------------------%
    if p == 30 %up
        %First we sum numbers that are alike from right to left
        for column = 1:4
            for row = 1:4
                if A(row,column)>0 %if the current column is non-zero
                    %Number of possible squares to the left = (5-column)-1 = 4 - column
                    for sumattempt = 1:4-row %if 0 it won't run -- so it won't break if its summing leftmost col
                        if A(row+sumattempt,column)>1
                            if A(row+sumattempt,column) == A(row,column)
                                A(row,column)=A(row,column)*2;
                                A(row+sumattempt,column) = 0;
                            end
                            break % no matter what if the number is nonzero we stop trying to sum it
                        end
                    end
                end
            end
        end
        %Next we are going to move over the values
        for column = 1:4
            Acol = A(:,column);
            NZAcol = Acol(Acol ~= 0);
            [sizeNZAcol,irrelivantVar] = size(NZAcol);
            if sizeNZAcol == 0 %All zeros already, do nothing
            end
            if sizeNZAcol == 1 %One non-zero term. Shift right
            Acol = [NZAcol(1);0;0;0];
            end
            if sizeNZAcol == 2 %Two non-zero term. Shift right
            Acol = [NZAcol(1);NZAcol(2);0;0];
            end
            if sizeNZAcol == 3 %Three non-zero term. Shift right
            Acol = [NZAcol(1);NZAcol(2);NZAcol(3);0];
            end
            if sizeNZAcol == 4 %All non-zeros already, do nothing
            end
            A(:,column) = Acol;
        end
    end
    % -----------------------------------------%
    % --------------ADD1-----------------------%
    % -----------------------------------------%
    
    %Finally we add another block
    iterationAB = 1;
    AddBlock = 0;
    disp(Aold)
    disp(A)
    if isequal(Aold,A)==0
        while AddBlock == 0 %also my favorite extension
            time = clock
            rand1 = mod(floor(time(6)*10^2),4)+1;
            rand2 = mod(floor(time(6)*10^3),4)+1;
            rand3 = (mod(floor(time(6)*10^4),2)+1)*2;
            if A(rand1,rand2) == 0
                A(rand1,rand2) = rand3;
                AddBlock = 1;
                disp(A)
            end
            iterationAB = iterationAB + 1;
            if iterationAB == 300
                disp('No moves remaining! sorry')
                AddBlock = 1;
                gameover = 1;
            end
            
            
            
            
            %Huge props to MatlabDoug on StackOverflow for this entire
            %section. It turns my data into something nice to view
            image(2.*A.^(0.5));            %# Create a colored plot of the matrix values
            map = colormap('HSV'); % added line
            map(end,:) = [1 1 1]; % added line
            colormap(flipud(map)); 
            textStrings = num2str(A(:));  %# Create strings from the matrix values
            textStrings = strtrim(cellstr(textStrings));  %# Remove any space padding
            [x,y] = meshgrid(1:4);   %# Create x and y coordinates for the strings
            hStrings = text(x(:),y(:),textStrings(:),...      %# Plot the strings
                            'HorizontalAlignment','center');
            midValue = mean(get(gca,'CLim'));  %# Get the middle value of the color range
            textColors = repmat(A(:) > midValue,1,3);  %# Choose white or black for the
                                                         %#   text color of the strings so
                                                         %#   they can be easily seen over
                                                         %#   the background color
            set(hStrings,{'Color'},num2cell(textColors,2));  %# Change the text colors
        end
    end
end
