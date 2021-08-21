function div = LT(grad)

[~,n1,n2,n3] = size(grad);

div = zeros(2,n1,n2,n3);

shift = circshift(squeeze(grad(1,:,:,:)),[1,0,0]);
div1 = squeeze(grad(1,:,:,:)) - shift;
div1(1,:,:) = grad(1,1,:,:);
div1(n1,:,:) = -shift(n1,:,:);

shift = circshift(squeeze(grad(2,:,:,:)),[0,1,0]);
div2 = squeeze(grad(2,:,:,:)) - shift;
div2(:,1,:) = grad(2,:,1,:);
div2(:,n2,:) = -shift(:,n2,:);

shift = circshift(squeeze(grad(3,:,:,:)),[0,0,1]);
div3 = squeeze(grad(3,:,:,:)) - shift;
div3(:,:,1) = grad(3,:,:,1);
div3(:,:,n3) = -shift(:,:,n3);

div(1,:,:,:) = div1 + div2 + div3;

shift = circshift(squeeze(grad(4,:,:,:)),[1,0,0]);
div1 = squeeze(grad(4,:,:,:)) - shift;
div1(1,:,:) = grad(4,1,:,:);
div1(n1,:,:) = -shift(n1,:,:);

shift = circshift(squeeze(grad(5,:,:,:)),[0,1,0]);
div2 = squeeze(grad(5,:,:,:)) - shift;
div2(:,1,:) = grad(5,:,1,:);
div2(:,n2,:) = -shift(:,n2,:);

shift = circshift(squeeze(grad(6,:,:,:)),[0,0,1]);
div3 = squeeze(grad(6,:,:,:)) - shift;
div3(:,:,1) = grad(6,:,:,1);
div3(:,:,n3) = -shift(:,:,n3);

div(2,:,:,:) = div1 + div2 + div3;

end

