classdef PhotoDiode < mladapter
    methods
        function obj = PhotoDiode(varargin)
            obj = obj@mladapter(varargin{:});
        end
        function continue_ = analyze(obj,p)
            continue_ = obj.Adapter.analyze(p);
            obj.Success = obj.Adapter.Success;
        end
        function draw(obj,p)
            obj.Adapter.draw(p);
            if 0 < p.scene_frame()
                p.PhotoDiodeStatus = ~p.PhotoDiodeStatus;
                mglactivategraphic([p.Screen.PhotodiodeWhite p.Screen.PhotodiodeBlack],[p.PhotoDiodeStatus ~p.PhotoDiodeStatus]);
            end
        end
    end
end
