clear;clc
A(5,5) = 0;
for  row = 1:5
    for col = 1:5
        if ( mod(row+col ,2) == 0 )
            A(row,col) = 1;
        else
            A(row,col) = 0;
        end
    end
end
colormap(gray);
imagesc(A);

title('YT 4.2 Part A  by  Riley Payung')