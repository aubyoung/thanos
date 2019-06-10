 #This PowerShell script creates a small SQLite DB with a table called "NAMES"
 #It populates the table with some data for testing


 #Import the module, and create the table
 Import-Module PSSQLite

   $Database = "C:\Names.SQLite"

    $Query = "CREATE TABLE NAMES (
        Fullname VARCHAR(20) PRIMARY KEY,
        Surname TEXT,
        Givenname TEXT,
        Birthdate DATETIME)"


    #SQLite will create Names.SQLite for us

    Invoke-SqliteQuery -Query $Query -DataSource $Database

    $query = "INSERT INTO NAMES (Fullname, Surname, Givenname, Birthdate)
                          VALUES (@full, 'Cookie', 'Monster', @BD)"

    Invoke-SqliteQuery -DataSource $Database -Query $query -SqlParameters @{
        full = "Cookie Monster"
        BD   = (get-date).addyears(-3)
    }

	$query = "INSERT INTO NAMES (Fullname, Surname, Givenname, Birthdate)
                          VALUES (@full, @first, @last, @BD)"

	Invoke-SqliteQuery -DataSource $Database -Query $query -SqlParameters @{
        full = "Michael Jackson"
		first = "Michael"
		last = "Jackson"
        BD = '1958-08-29'
    }

	$query = "INSERT INTO NAMES (Fullname, Surname, Givenname, Birthdate)
                          VALUES (@full, @first, @last, @BD)"

	Invoke-SqliteQuery -DataSource $Database -Query $query -SqlParameters @{
        full = "Jane Doe"
		first = "Jane"
		last = "Doe"
        BD = '1959-08-29'
    }


	$query = "INSERT INTO NAMES (Fullname, Surname, Givenname, Birthdate)
                          VALUES (@full, @first, @last, @BD)"

	Invoke-SqliteQuery -DataSource $Database -Query $query -SqlParameters @{
        full = "John Doe"
		first = "John"
		last = "Doe"
        BD = '1960-08-29'
    }


	$query = "INSERT INTO NAMES (Fullname, Surname, Givenname, Birthdate)
                          VALUES (@full, @first, @last, @BD)"

	Invoke-SqliteQuery -DataSource $Database -Query $query -SqlParameters @{
        full = "Jackie Onassis"
		first = "Jackie"
		last = "Onassis"
        BD = '1929-07-28'
    }