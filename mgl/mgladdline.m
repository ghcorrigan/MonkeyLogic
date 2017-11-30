function id = mgladdline(color,sz,type,devices)
%id = mgladdline(color,size)
%   id - graphic object id
%   sz - number of line segments
%   type - list (1), strip (2)
%
%   The subject or control screen (or both) should be created before adding
%   any graphic object.
%
%   May 4, 2016     Written by Jaewon Hwang (jaewon.hwang@hotmail.com)

if ~exist('color','var') || isempty(color), color = [1 0 0]; end
if max(color) <=1, color = color * 255; end
color = uint8(color);

if ~exist('sz','var'), sz = 50; end
if ~exist('type','var'), type = 1; end
if ~exist('devices','var'), devices = 2; end

id = mdqmex(20,color,sz,type,devices);
