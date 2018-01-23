classdef OnsetDetector < mladapter
    properties (SetAccess = protected)
        Time
    end
    
    methods
        function obj = OnsetDetector(varargin)
            obj = obj@mladapter(varargin{:});
            if 0==nargin, return, end
            
            obj.Success = false;
        end
        function init(obj,p)
            obj.Adapter.init(p);
            obj.Success = false;
        end
        function continue_ = analyze(obj,p)
            continue_ = obj.Adapter.analyze(p);
            if ~obj.Success && obj.Adapter.Success
                if isprop(obj.Adapter,'Time'), obj.Time = obj.Adapter.Time(1); end
                obj.Success = true;
            end
        end
    end
end
