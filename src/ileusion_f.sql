CREATE OR REPLACE Function ILEUSION_CALL (
    inJSON Char(1024)
)
returns Char(1024)
language rpgle
not deterministic
external name 'ILEUSION/ILEUSION_S(ILEUSION_CALL)'
parameter style GENERAL;