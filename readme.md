## ILEusion

ILEusion a.k.a. XMLService 2 / xmlservice with JSON. ILEusion is an application whichs allows your IBM i (programs, export function, data areas, data queues, etc) reached via SQL function. ILEusion used to be callable via web service, but now you just pass in the JSON into the under-defined function.

For example:

```sql
--FAK100 program call
select ileusion.ILEUSION_CALL(cast('[{"action": "/call", "object":"FAK100","library":"ILEUSION","args":[{"value":"John","type":"char","length":20},{"value":11,"type":"int","length":10},{"value":8,"type":"int","length":10},{"value":0,"type":"int","length":10}]}]' as char(1024))) from sysibm.sysdummy1;
--FAK101 program call
select ileusion.ILEUSION_CALL(cast('[{"action": "/call", "object":"FAK101","library":"ILEUSION","args":[{"value":"Dave","type":"char","length":20},{"values":[3,3,5],"type":"int","length":10}]}]' as char(1024))) from sysibm.sysdummy1;
--Data queue insert and pop
select ileusion.ILEUSION_CALL(cast('[{"action":"/dq/send","library":"ILEUSION","object":"TESTDQ","data":"Hello world"},{"action":"/dq/pop","library":"ILEUSION","object":"TESTDQ","length":20}]' as char(1024))) from sysibm.sysdummy1;
--DS1 program call (with struct)
select ileusion.ILEUSION_CALL(cast('[{"action":"/call","library":"ILEUSION","object":"DS1","args":[{"type":"struct","value":[{"type":"char","length":20,"value":"Liam"},{"type":"int","length":3,"value":11},{"type":"packed","length":11,"precision":2,"value":12.34}]}]}]' as char(1024))) from sysibm.sysdummy1;
```

[JSON schemas here](https://sitemule.github.io/ileusion/api) (outdated, new one in progress).

ILEusion uses Sitemule's [excellent noxDB library](https://github.com/sitemule/noxDB) as the JSON parser.

## Setup

```
git clone git@github.com:sitemule/noxDB.git
git clone git@github.com:worksofliam/ileusion.git
cd noxDB
gmake

cd ../ileusion
gmake
```
