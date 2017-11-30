classdef WaitThenHold < mladapter
    properties
        WaitTime = 0;  % time to wait for fixation
        HoldTime = 0;  % time to hold fixation
    end
    properties (SetAccess = protected)
        Running
        Waiting  % status variable indicating whether we are still waiting for fixation
        AcquiredTime
    end
    
    methods
        function obj = WaitThenHold(varargin)
            obj = obj@mladapter(varargin{:});
        end
        function init(obj,p)
            obj.Adapter.init(p);
            obj.Success = false;

            obj.Running = true;
            obj.Waiting = true;
			obj.AcquiredTime = [];
        end
        function fini(obj,p)
            obj.Adapter.fini(p);
            if obj.Success, p.EyeFixPeriod = [obj.AcquiredTime 0] + obj.HoldTime/2; end
        end
        function continue_ = analyze(obj,p)
            obj.Adapter.analyze(p);
            if ~obj.Running, continue_ = false; return, end

            % The lower-lever adapter (obj.Adapter) is FixateTarget of
            % which Success is true when the fixation is acquired.
            good = obj.Adapter.Success;  % is the subject fixating to the target?
            elapsed = p.scene_time;      % time elapsed from the scene start

            % If we are still waiting but the subject is not looking, check if
            % the wait time is over. If so, stop tracking and end the scene.
            if obj.Waiting && ~good
                obj.Running = elapsed < obj.WaitTime;
                continue_ = obj.Running;
                return
            end
            
            % If we were waiting for fixation and the subject is looking now,
            % then indicate that we are not waiting and set the hold end time.
            if obj.Waiting && good
                obj.AcquiredTime = obj.Adapter.Time;
                obj.Waiting = false;
                obj.HoldTime = obj.HoldTime + elapsed;
            end
            
            % If the subject fixated but is not looking at the target anymore
            % (i.e., broke the fixation), then stop tracking and end the scene.
            if ~obj.Waiting && ~good
                obj.Running = false;
                continue_ = false;
                return
            end
            
            % If the subject fixated and is still looking at it, check if
            % the hold requirement is met. If so, indicate that the
            % behavior is detected and end the scene. Otherwise, keep
            % tracking.
            if ~obj.Waiting && good
                if elapsed < obj.HoldTime
                    continue_ = true;
                else
                    obj.Success = true;
                    obj.Running = false;
                    continue_ = false;
                end
                return
            end
            
            % If none of the above things happened, keep tracking to the next frame.
            continue_ = true;
        end
        function stop(obj)
            obj.Running = false;
        end
    end
end
