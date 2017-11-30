classdef ClosedLoopStimulator < mladapter
    properties
        Channel
        Waveform
        Frequency
    end
    properties (SetAccess = protected)
    end
    properties (Access = protected)
    end
    
    methods
        function obj = ClosedLoopStimulator(varargin)
            obj = obj@mladapter(varargin{:});
        end
        
        function set.Channel(obj,val)
            non_stim = ~ismember(val,obj.Tracker.DAQ.stimulation_available);
            if any(non_stim), error('Stimulation #%d is not assigned.',val(find(non_stim,1))); end
            obj.Channel = val;
        end
        
        function init(obj,p)
            obj.Adapter.init(p);
            obj.Success = false;
            
        end
        function fini(obj,p)
            obj.Adapter.fini(p);
            mglactivategraphic(obj.Tracker.Screen.Stimulation(:,obj.Channel),false);
        end
        function continue_ = analyze(obj,p)
            continue_ = obj.Adapter.analyze(p);
            obj.Success = obj.Adapter.Success;
            if obj.Success
            else
                stop(obj.AO)
            end
        end
        function draw(obj,p)
            obj.Adapter.draw(p);
            if obj.Success
                mglactivategraphic(obj.Tracker.Screen.Stimulation(:,obj.Channel),true);
            else
                mglactivategraphic(obj.Tracker.Screen.Stimulation(:,obj.Channel),false);
            end
        end
    end
end
