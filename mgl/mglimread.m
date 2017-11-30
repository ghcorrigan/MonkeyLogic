function A = mglimread(filename)

[~,~,e] = fileparts(filename);
switch lower(e)
    case {'.avi','.mpg','.mpeg'}
        id = mgladdmovie(filename,0);
        frames = mglgetproperty(id,'getbuffer');
        A = frames(:,:,:,1);
        mgldestroygraphic(id);
        
    otherwise
        [A,map,transparency] = imread(filename);
        if ~isempty(map)
            [m,n] = size(A);
            map = uint8(255 * map);
            A = reshape(map(A,:),m,n,3);
        end
        if ~isempty(transparency)
            A = cat(3,transparency,A);
        end
end
