

function [net,info]= cnn()

imdb  = cnn_data();

net   = cnn_init();

save('data/exp/imdb.mat', '-struct', 'imdb') ;

function [im, labels] = getBatch(imdb, batch)

  im = imdb.images.data(:,:,:,batch) ;

  labels = imdb.images.labels(:,:,:,batch) ;

end


[net,info] = cnn_train(net, imdb, @getBatch);

end
 



