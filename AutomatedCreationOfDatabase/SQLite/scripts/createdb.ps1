 #Import the module, create a data source and a table
 Import-Module PSSQLite

   $Database = "C:\Names.SQLite"

    $Query = "CREATE TABLE NAMES (
        Fullname VARCHAR(20) PRIMARY KEY,
        Surname TEXT,
        Givenname TEXT,
        Birthdate DATETIME)"

    #SQLite will create Names.SQLite for us

    Invoke-SqliteQuery -Query $Query -DataSource $Database

# Loop through the lines in the text file
$queries = Get-Content ("queries.txt")

For ($i=0; $i -lt $queries.Length; $i++) {
	$query = $queries[$i];

	"Line $i, the query is  $query"
	Invoke-SqliteQuery -DataSource $Database -Query $query
}