classdef OnOffMarker < mladapter
    properties
        OnMarker = 1;
        OffMarker = 2;
    end
    
    methods
        function obj = OnOffMarker(varargin)
            obj = obj@mladapter(varargin{:});
        end
        function init(obj,p)
            obj.Adapter.init(p);
            obj.Success = obj.Adapter.Success;
        end
        function continue_ = analyze(obj,p)
            continue_ = obj.Adapter.analyze(p);
            if obj.Success~=obj.Adapter.Success
                obj.Success = obj.Adapter.Success;
                if obj.Success, p.DAQ.eventmarker(obj.OnMarker); else, p.DAQ.eventmarker(obj.OffMarker); end
            end
        end
    end
end
