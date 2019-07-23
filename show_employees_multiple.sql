 CREATE OR REPLACE FUNCTION show_employees_multiple() RETURNS SETOF refcursor AS $$
    DECLARE
      ref1 refcursor;           -- Declare cursor variables
      ref2 refcursor;                             
    BEGIN
      OPEN ref1 FOR SELECT employeeid, employeename, employeeaddress FROM employee WHERE employeeid = '100';   -- Open the first cursor
      RETURN NEXT ref1;                                                                              -- Return the cursor to the caller
 
      OPEN ref2 FOR SELECT employeeid, employeename, employeeaddress FROM employee WHERE employeeid = '300';   -- Open the second cursor
      RETURN NEXT ref2;                                                                              -- Return the cursor to the caller
    END;
    $$ LANGUAGE plpgsql;