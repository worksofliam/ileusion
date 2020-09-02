

          Dcl-Pr Handle_Action Pointer;
            pDocument Pointer;
          End-Pr;
          
          Dcl-Pr Generate_Error Pointer;
            pMessage   Pointer Value Options(*String);
            pErrorCode Pointer Value Options(*String:*NoPass);
          End-Pr;