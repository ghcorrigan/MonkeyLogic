function daqreset()

s = evalin('caller','whos');
for m=1:length(s)
    switch s(m).class
        case {'analoginput','aichannel','analogoutput','aochannel','digitalio','dioline'}
            evalin('caller',['delete(' s(m).name ')']);
            evalin('caller',['clear(''' s(m).name ''')']);
    end
end
s = evalin('base','whos');
for m=1:length(s)
    switch s(m).class
        case {'analoginput','aichannel','analogoutput','aochannel','digitalio','dioline'}
            evalin('base',['delete(' s(m).name ')']);
            evalin('base',['clear(''' s(m).name ''')']);
    end
end

mdqmex(81);

end