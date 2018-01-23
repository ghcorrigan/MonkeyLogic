classdef RunSceneParam < handle
    properties
        Screen
        DAQ
        FrameNum
        SceneStartTime
        SceneStartFrame
        EyeOffset
        JoyOffset
        Mouse
        ShowJoyCursor
        SimulationMode
        EventMarker
        PhotoDiodeStatus
        
        EyeTargetRecord     % [xdeg ydeg start_time duration]
        User
        
        trialtime
        goodmonkey
        dashboard
    end
    
    methods
        function obj = RunSceneParam()
            obj.FrameNum = 0;
            obj.EyeOffset = [0 0];
            obj.JoyOffset = [0 0];
            obj.ShowJoyCursor = true;
            obj.User = struct;
           
            reset(obj);
        end
        
        function set.EventMarker(obj,val)
            if isempty(val), obj.EventMarker = []; else, obj.EventMarker = [obj.EventMarker val]; end
        end
        function [s,t] = scene_time(obj)
            t = obj.trialtime();
            s = t - obj.SceneStartTime;
        end
        function f = scene_frame(obj)
            f = obj.FrameNum - obj.SceneStartFrame;
        end
        function eventmarker(obj,code)
            obj.EventMarker = code;
        end
    end
    
    methods (Hidden)
        function reset(obj)
            obj.EventMarker = [];
            obj.EyeTargetRecord = [];
        end
    end
end
