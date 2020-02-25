-- This function is used to create the Patient and Kin tables
-- using the "IF NOT EXISTS" option prevents an error if the 
-- table already exists in the database. We could have deleted
-- the tables and recreated them but then you lose any 
-- existing data which is not a good thing...
-- This code is here for convenience so that this channel works
-- 'out of the box'.  It is probably a good idea to comment out
-- the call to the code in here once you have installed the
-- channel and run it in the editor once.
function CreateTables(DB)
   -- For consistency we chose to use the same SQL that is
   -- generated by Iguana when creating tables from the VMD
   -- (reformatted over multiple lines for readability)
   -- NOTE: One change - we added "IF NOT EXISTS"
   local sql_create = [[
   CREATE TABLE IF NOT EXISTS Patient (
      Id TEXT(255) NOT NULL,
      FirstName TEXT(255),
      LastName TEXT(255),
      Gender TEXT(255),
      PRIMARY KEY (Id)
    );
   ]]
   DB:execute{sql=sql_create, live=true}   
   
   -- must create tables separately with SQLite
   -- running two commands seprated by ";" does not work
   sql_create = [[
   CREATE TABLE IF NOT EXISTS Kin (
      PatientId TEXT(255) NOT NULL,
      LastName TEXT(255),
      FirstName TEXT(255),
      Relationship TEXT(255)
   );
   ]]
   DB:execute{sql=sql_create, live=true} 
   
   
   
   local sql_create = [[
   CREATE TABLE IF NOT EXISTS [Patient Test] (
      Id TEXT(255) NOT NULL,
      [First Name] TEXT(255),
      LastName TEXT(255),
      Gender TEXT(255),
      PRIMARY KEY (Id)
    );
   ]]
   DB:execute{sql=sql_create, live=true}   
   
   
   
   
   
   return "REMOVE ME AFTER YOU INSTALL THIS CHANNEL"
end

function DatabaseLocation(DB)
   return "SQLite DB: "..iguana.workingDir()..DB:info().name
end