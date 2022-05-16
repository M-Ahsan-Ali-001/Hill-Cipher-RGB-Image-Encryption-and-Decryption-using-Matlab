org_pic=imread('C:\Users\Anonymous Guy\Desktop\pic_asgn.jpg');% reading photo from computer

org_reshape=imresize(org_pic,[256,256]);%reshaping photo to 256 x 256


key=[356 357; 355 356;];% key to be multipied

key_i=[356 155; 157 356;]; % inverse key to be multiplied

[ encrypted_pic ] = Encryption( org_reshape ,key );% calling encryption function 

[ Decrypted_pic ] = Decryption( encrypted_pic,key_i );% calling decryption function 

subplot(1,3,1),imshow(org_reshape),title('ORIGNAL');%printing the images
subplot(1,3,2),imshow(encrypted_pic),title('ENCRYPTED');
subplot(1,3,3),imshow(Decrypted_pic ),title('DECRYPTED');