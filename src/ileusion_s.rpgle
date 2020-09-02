
        ctl-opt decEdit('0,') datEdit(*YMD.) NoMain;
        ctl-opt debug(*yes);
        
        /include ./headers/actions_h.rpgle
        /include ./headers/jsonparser.rpgle

        dcl-proc ileusion_call Export;

          dcl-pi ileusion_call Char(1024);
            pJSON Char(1024);
          end-pi;
          
          Dcl-S lEndpoint Varchar(128);
          Dcl-S lMethod   Varchar(10);
          Dcl-S lDocument Pointer;
          Dcl-S lResponse Pointer;
          
          lDocument = JSON_ParseString(%Addr(pJSON));
          If (JSON_Error(lDocument));
            lResponse = Generate_Error('Error parsing JSON.');
            
          Else;
              lResponse = Handle_Action(lDocument);
              
          Endif;
          
          JSON_NodeDelete(lDocument);
          
          Return json_AsJsonText(lResponse);
          
        end-proc;