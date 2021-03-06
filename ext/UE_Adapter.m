classdef UE_Adapter < mladapter  % Change the class name
    properties
        % Define user variables here. All variables must be initialized.
        IPAddress = '127.0.0.1';
        Port = uint16(1666);
        BufferSize = uint16(2^16);
        Terminator = '\r\n';
        TimeOut = float(1.00);
        pyObj = [];
        
        %Player States
        Positions=[];
        States=[];
        
        %TCP connection
        TcpState = false; 
        
    end
    properties (SetAccess = protected)
        % Variables that users need to read but should not change
        
    end
    properties (Access = protected)
        % Variables that should not be accessible from the outside of the object
        
    end
    
    methods
        function obj = UE_Adapter(varargin)  % Change the function name
            obj = obj@mladapter(varargin{:});
        end
        
        function delete(obj) %#ok<INUSD>
            % Things to do when this adapter is destroyed
        end
        
        function init(obj,p)
            obj.Adapter.init(p);
            obj.Success = false;
            
            % Define things to do before a scene starts here
            
        end
        function fini(obj,p)
            obj.Adapter.fini(p);
            
            % Define things to do after a scene finishes here
            
        end
        function continue_ = analyze(obj,p)
            continue_ = obj.Adapter.analyze(p);
            obj.Success = obj.Adapter.Success;
            
            % This function is called every frame during the scene.
            % Do things to detect behavior here.
            %
            % Two variables are important.
            % continue_ determines whether the analysis will be continued to next frame.
            % obj.Success indicates whether the behavior is detected.
            %
            % See WaitThenHold.m for an example.
            
        end
        function draw(obj,p)
            obj.Adapter.draw(p);
            
            % This function is called every frame during the scene.
            % Update graphics related to this adapter here.
            
        end
    end
end
