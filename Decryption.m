function [ Decrypted_pic ] = Decryption( pic,key_i )
en1=pic(:,:,1);%saving red layer of image to m1 variable
en2=pic(:,:,2);%saving green layer of image to m1 variable
en3=pic(:,:,3);%saving blue layer of image to m1 variable

en1=mat2cell(en1,2*ones(1,128),2*ones(1,128));%converting to 2x2 blocks/cells
en2=mat2cell(en2,2*ones(1,128),2*ones(1,128));
en3=mat2cell(en3,2*ones(1,128),2*ones(1,128));


i=1,j=1,num=1;
while(i<=128)% using loop to multiply and take mod on 2x2 blocks
    while(j<=128)
        
        x=en1{j,i};
        d1{num}=mod(key_i*double(x),256);
         y=en2{j,i};
        d2{num}=mod(key_i*double(y),256);
         z=en3{j,i};
        d3{num}=mod(key_i*double(z),256);
        num=num+1;
        j=j+1;
        
    end
    i=i+1;
    j=1;
    
end

e1=reshape(d1,[128,128]);%reshaping the blocks
e1=cell2mat(e1);%converting cell to matrix
e1=uint8(e1);% conveting to uint 8 so that values in matrices lies in 0-255

e2=reshape(d2,[128,128]);
e2=cell2mat(e2);
e2=uint8(e2);

e3=reshape(d3,[128,128]);
e3=cell2mat(e3);
e3=uint8(e3);


dec_pic=cat(3,e1,e2,e3);% join the three layers
Decrypted_pic=dec_pic;%returning image


end

