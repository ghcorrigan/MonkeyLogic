function id = mgladdtext(string,devices)
%id = mgladdtext(string,devices)
%   id - graphic object id
%
%   The subject or control screen (or both) should be created before adding
%   any graphic object.
%
%   May 4, 2016     Written by Jaewon Hwang (jaewon.hwang@hotmail.com)

if ~exist('devices','var'), devices = 3; end

id = mdqmex(26,string,devices);
