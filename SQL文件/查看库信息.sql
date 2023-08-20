













SELECT name,
       SUSER_SNAME(owner_sid) AS owner,
       create_date
FROM sys.databases
WHERE name = 'Graduate';
