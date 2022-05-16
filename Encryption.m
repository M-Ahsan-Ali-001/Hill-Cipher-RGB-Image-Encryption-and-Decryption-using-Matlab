function [ encrypted_pic ] = Encryption( org_reshape ,key )
m1=org_reshape(:,:,1);%saving red layer of image to m1 variable
m2=org_reshape(:,:,2);%saving green layer of image to m2 variable
m3=org_reshape(:,:,3);%saving blue layer of image to m3 variable

mm1=mat2cell(m1,2*ones(1,128),2*ones(1,128));%converting to 2x2 blocks/cells
mm2=mat2cell(m2,2*ones(1,128),2*ones(1,128));
mm3=mat2cell(m3,2*ones(1,128),2*ones(1,128));



i=1,j=1,num=1;
while(i<=128)% using loop to multiply and take mod on 2x2 blocks
    while(j<=128)
        
        x=mm1{j,i};
        c1{num}=mod(key*double(x),256);
         y=mm2{j,i};
        c2{num}=mod(key*double(y),256);
         z=mm3{j,i};
        c3{num}=mod(key*double(z),256);
        num=num+1;
        j=j+1;
        
    end
    i=i+1;
    j=1;
    
end

e1=reshape(c1,[128,128]);%reshaping the blocks
e1=cell2mat(e1);%converting cell to matrix
e1=uint8(e1);% conveting to uint 8 so that values in matrices lies in 0-255

e2=reshape(c2,[128,128]);
e2=cell2mat(e2);
e2=uint8(e2);

e3=reshape(c3,[128,128]);
e3=cell2mat(e3);
e3=uint8(e3);


pic=cat(3,e1,e2,e3);% join the three layers
encrypted_pic=pic; %returning image
end

