classdef OnOffMarker < mladapter
    properties
        OnMarker
        OffMarker
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
                if obj.Success
                    if ~isempty(obj.OnMarker), p.DAQ.eventmarker(obj.OnMarker); end
                else
                    if ~isempty(obj.OffMarker), p.DAQ.eventmarker(obj.OffMarker); end
                end
            end
        end
    end
end
