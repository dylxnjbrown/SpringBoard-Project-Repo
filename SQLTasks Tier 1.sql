/* Welcome to the SQL mini project. You will carry out this project partly in
the PHPMyAdmin interface, and partly in Jupyter via a Python connection.

This is Tier 1 of the case study, which means that there'll be more guidance for you about how to 
setup your local SQLite connection in PART 2 of the case study. 

The questions in the case study are exactly the same as with Tier 2. 

PART 1: PHPMyAdmin
You will complete questions 1-9 below in the PHPMyAdmin interface. 
Log in by pasting the following URL into your browser, and
using the following Username and Password:

URL: https://sql.springboard.com/
Username: student
Password: learn_sql@springboard

The data you need is in the "country_club" database. This database
contains 3 tables:
    i) the "Bookings" table,
    ii) the "Facilities" table, and
    iii) the "Members" table.

In this case study, you'll be asked a series of questions. You can
solve them using the platform, but for the final deliverable,
paste the code for each solution into this script, and upload it
to your GitHub.

Before starting with the questions, feel free to take your time,
exploring the data, and getting acquainted with the 3 tables. */


/* QUESTIONS 
/* Q1: Some of the facilities charge a fee to members, but some do not.
Write a SQL query to produce a list of the names of the facilities that do. */

CODE
SELECT name 
FROM Facilities 
WHERE membercost > 0;

OUTPUT
name
Tennis Court 1
Tennis Court 2
Massage Room 1
Massage Room 2
Squash Court

/* Q2: How many facilities do not charge a fee to members? */

CODE
SELECT COUNT(*) 
FROM Facilities 
WHERE membercost = 0;

OUTPUT
COUNT(*)
4

/* Q3: Write an SQL query to show a list of facilities that charge a fee to members,
where the fee is less than 20% of the facility's monthly maintenance cost.
Return the facid, facility name, member cost, and monthly maintenance of the
facilities in question. */

CODE
SELECT facid, name, membercost, monthlymaintenance
FROM Facilities
WHERE membercost > 0 
  AND membercost < (monthlymaintenance * 0.2);

OUTPUT
facid	name	membercost	monthlymaintenance	
0	Tennis Court 1	5.0	200
1	Tennis Court 2	5.0	200
4	Massage Room 1	9.9	3000
5	Massage Room 2	9.9	3000
6	Squash Court	3.5	80

/* Q4: Write an SQL query to retrieve the details of facilities with ID 1 and 5.
Try writing the query without using the OR operator. */

CODE
SELECT * FROM Facilities 
WHERE facid IN (1, 5);

OUTPUT
facid Ascending 1	name	membercost	guestcost	initialoutlay	monthlymaintenance	
1	Tennis Court 2	5.0	25.0	8000	200
5	Massage Room 2	9.9	80.0	4000	3000

/* Q5: Produce a list of facilities, with each labelled as
'cheap' or 'expensive', depending on if their monthly maintenance cost is
more than $100. Return the name and monthly maintenance of the facilities
in question. */

CODE
SELECT name, monthlymaintenance,
    CASE WHEN monthlymaintenance > 100 THEN 'expensive'
         ELSE 'cheap' END AS label
FROM Facilities;

OUTPUT
name	monthlymaintenance	label	
Tennis Court 1	200	expensive
Tennis Court 2	200	expensive
Badminton Court	50	cheap
Table Tennis	10	cheap
Massage Room 1	3000	expensive
Massage Room 2	3000	expensive
Squash Court	80	cheap
Snooker Table	15	cheap
Pool Table	15	cheap

/* Q6: You'd like to get the first and last name of the last member(s)
who signed up. Try not to use the LIMIT clause for your solution. */

CODE
SELECT firstname, surname 
FROM Members 
WHERE joindate = (SELECT MAX(joindate) FROM Members);

OUTPUT
firstname	surname	
Darren	Smith

/* Q7: Produce a list of all members who have used a tennis court.
Include in your output the name of the court, and the name of the member
formatted as a single column. Ensure no duplicate data, and order by
the member name. */

CODE
SELECT DISTINCT f.name AS facility_name, 
                CONCAT(m.firstname, ' ', m.surname) AS member_name
FROM Bookings b
JOIN Facilities f ON b.facid = f.facid
JOIN Members m ON b.memid = m.memid
WHERE f.name LIKE 'Tennis Court%'
ORDER BY member_name;

OUTPUT
facility_name	member_name Ascending 1	
Tennis Court 1	Anne Baker
Tennis Court 2	Anne Baker
Tennis Court 2	Burton Tracy
Tennis Court 1	Burton Tracy
Tennis Court 2	Charles Owen
Tennis Court 1	Charles Owen
Tennis Court 2	Darren Smith
Tennis Court 1	David Farrell
Tennis Court 2	David Farrell
Tennis Court 2	David Jones
Tennis Court 1	David Jones
Tennis Court 1	David Pinker
Tennis Court 1	Douglas Jones
Tennis Court 1	Erica Crumpet
Tennis Court 1	Florence Bader
Tennis Court 2	Florence Bader
Tennis Court 1	Gerald Butters
Tennis Court 2	Gerald Butters
Tennis Court 1	GUEST GUEST
Tennis Court 2	GUEST GUEST
Tennis Court 2	Henrietta Rumney
Tennis Court 2	Jack Smith
Tennis Court 1	Jack Smith
Tennis Court 1	Janice Joplette
Tennis Court 2	Janice Joplette
Tennis Court 1	Jemima Farrell
Tennis Court 2	Jemima Farrell
Tennis Court 1	Joan Coplin
Tennis Court 1	John Hunt
Tennis Court 2	John Hunt
Tennis Court 1	Matthew Genting
Tennis Court 2	Millicent Purview
Tennis Court 1	Nancy Dare
Tennis Court 2	Nancy Dare
Tennis Court 1	Ponder Stibbons
Tennis Court 2	Ponder Stibbons
Tennis Court 2	Ramnaresh Sarwin
Tennis Court 1	Ramnaresh Sarwin
Tennis Court 1	Tim Boothe
Tennis Court 2	Tim Boothe
Tennis Court 2	Tim Rownam
Tennis Court 1	Tim Rownam
Tennis Court 2	Timothy Baker
Tennis Court 1	Timothy Baker
Tennis Court 1	Tracy Smith
Tennis Court 2	Tracy Smith

/* Q8: Produce a list of bookings on the day of 2012-09-14 which
will cost the member (or guest) more than $30. Remember that guests have
different costs to members (the listed costs are per half-hour 'slot'), and
the guest user's ID is always 0. Include in your output the name of the
facility, the name of the member formatted as a single column, and the cost.
Order by descending cost, and do not use any subqueries. */

CODE
SELECT f.name AS facility, 
       CONCAT(m.firstname, ' ', m.surname) AS member_name,
       CASE WHEN b.memid = 0 THEN b.slots * f.guestcost
            ELSE b.slots * f.membercost END AS cost
FROM Bookings b
JOIN Facilities f ON b.facid = f.facid
JOIN Members m ON b.memid = m.memid
WHERE b.starttime >= '2012-09-14' AND b.starttime < '2012-09-15'
  AND ((b.memid = 0 AND b.slots * f.guestcost > 30) OR
       (b.memid <> 0 AND b.slots * f.membercost > 30))
ORDER BY cost DESC;

OUTPUT
facility	member_name	cost Descending 1	
Massage Room 2	GUEST GUEST	320.0
Massage Room 1	GUEST GUEST	160.0
Massage Room 1	GUEST GUEST	160.0
Massage Room 1	GUEST GUEST	160.0
Tennis Court 2	GUEST GUEST	150.0
Tennis Court 1	GUEST GUEST	75.0
Tennis Court 2	GUEST GUEST	75.0
Tennis Court 1	GUEST GUEST	75.0
Squash Court	GUEST GUEST	70.0
Massage Room 1	Jemima Farrell	39.6
Squash Court	GUEST GUEST	35.0
Squash Court	GUEST GUEST	35.0

/* Q9: This time, produce the same result as in Q8, but using a subquery. */

CODE
SELECT member_name, facility, cost FROM (
    SELECT CONCAT(m.firstname, ' ', m.surname) AS member_name,
           f.name AS facility,
           CASE WHEN b.memid = 0 THEN b.slots * f.guestcost
                ELSE b.slots * f.membercost END AS cost
    FROM Bookings b
    JOIN Facilities f ON b.facid = f.facid
    JOIN Members m ON b.memid = m.memid
    WHERE b.starttime >= '2012-09-14' AND b.starttime < '2012-09-15'
) AS subquery
WHERE cost > 30
ORDER BY cost DESC;

OUTPUT
member_name	facility	cost Descending 1	
GUEST GUEST	Massage Room 2	320.0
GUEST GUEST	Massage Room 1	160.0
GUEST GUEST	Massage Room 1	160.0
GUEST GUEST	Massage Room 1	160.0
GUEST GUEST	Tennis Court 2	150.0
GUEST GUEST	Tennis Court 1	75.0
GUEST GUEST	Tennis Court 1	75.0
GUEST GUEST	Tennis Court 2	75.0
GUEST GUEST	Squash Court	70.0
Jemima Farrell	Massage Room 1	39.6
GUEST GUEST	Squash Court	35.0
GUEST GUEST	Squash Court	35.0

________________________________________________________


/* PART 2: SQLite
/* We now want you to jump over to a local instance of the database on your machine. 

Copy and paste the LocalSQLConnection.py script into an empty Jupyter notebook, and run it. 

Make sure that the SQLFiles folder containing thes files is in your working directory, and
that you haven't changed the name of the .db file from 'sqlite\db\pythonsqlite'.

You should see the output from the initial query 'SELECT * FROM FACILITIES'.

Complete the remaining tasks in the Jupyter interface. If you struggle, feel free to go back
to the PHPMyAdmin interface as and when you need to. 

You'll need to paste your query into value of the 'query1' variable and run the code block again to get an output.
 
QUESTIONS:
/* Q10: Produce a list of facilities with a total revenue less than 1000.
The output of facility name and total revenue, sorted by revenue. Remember
that there's a different cost for guests and members! */

CODE
def select_all_tasks(conn):
    """
    Query all rows in the tasks table
    :param conn: the Connection object
    :return:
    """
    cur = conn.cursor()
    
    # Place your SQL query between the triple quotes below
    query1 = """
        SELECT 
            f.name, 
            SUM(CASE 
                WHEN b.memid = 0 THEN b.slots * f.guestcost 
                ELSE b.slots * f.membercost 
            END) AS revenue
        FROM Bookings AS b
        INNER JOIN Facilities AS f ON b.facid = f.facid
        GROUP BY f.name
        HAVING revenue < 1000
        ORDER BY revenue;
        """
        
    cur.execute(query1)
 
    rows = cur.fetchall()
 
    for row in rows:
        print(row)

OUTPUT
2.6.0
2. Query all tasks
('Table Tennis', 180)
('Snooker Table', 240)
('Pool Table', 270)

/* Q11: Produce a report of members and who recommended them in alphabetic surname,firstname order */

CODE
def select_all_tasks(conn):
    cur = conn.cursor()
    
    query1 = """
        SELECT 
            m.surname AS member_surname, 
            m.firstname AS member_firstname, 
            r.surname AS recommender_surname, 
            r.firstname AS recommender_firstname
        FROM Members AS m
        LEFT JOIN Members AS r ON m.recommendedby = r.memid
        WHERE m.memid > 0
        ORDER BY m.surname, m.firstname;
        """
        
    cur.execute(query1)
    rows = cur.fetchall()
    for row in rows:
        print(row)
        

OUTPUT
2.6.0
2. Query all tasks
('Bader', 'Florence', 'Stibbons', 'Ponder')
('Baker', 'Anne', 'Stibbons', 'Ponder')
('Baker', 'Timothy', 'Farrell', 'Jemima')
('Boothe', 'Tim', 'Rownam', 'Tim')
('Butters', 'Gerald', 'Smith', 'Darren')
('Coplin', 'Joan', 'Baker', 'Timothy')
('Crumpet', 'Erica', 'Smith', 'Tracy')
('Dare', 'Nancy', 'Joplette', 'Janice')
('Farrell', 'David', None, None)
('Farrell', 'Jemima', None, None)
('Genting', 'Matthew', 'Butters', 'Gerald')
('Hunt', 'John', 'Purview', 'Millicent')
('Jones', 'David', 'Joplette', 'Janice')
('Jones', 'Douglas', 'Jones', 'David')
('Joplette', 'Janice', 'Smith', 'Darren')
('Mackenzie', 'Anna', 'Smith', 'Darren')
('Owen', 'Charles', 'Smith', 'Darren')
('Pinker', 'David', 'Farrell', 'Jemima')
('Purview', 'Millicent', 'Smith', 'Tracy')
('Rownam', 'Tim', None, None)
('Rumney', 'Henrietta', 'Genting', 'Matthew')
('Sarwin', 'Ramnaresh', 'Bader', 'Florence')
('Smith', 'Darren', None, None)
('Smith', 'Darren', None, None)
('Smith', 'Jack', 'Smith', 'Darren')
('Smith', 'Tracy', None, None)
('Stibbons', 'Ponder', 'Tracy', 'Burton')
('Tracy', 'Burton', None, None)
('Tupperware', 'Hyacinth', None, None)
('Worthington-Smyth', 'Henry', 'Smith', 'Tracy')


/* Q12: Find the facilities with their usage by member, but not guests */

CODE
def select_all_tasks(conn):
    cur = conn.cursor()
    
    query1 = """
        SELECT 
            f.name, 
            SUM(b.slots) AS member_usage
        FROM Bookings AS b
        INNER JOIN Facilities AS f ON b.facid = f.facid
        WHERE b.memid > 0
        GROUP BY f.name
        ORDER BY member_usage DESC;
        """
        
    cur.execute(query1)
    rows = cur.fetchall()
    for row in rows:
        print(row)

OUTPUT
2.6.0
2. Query all tasks
('Badminton Court', 1086)
('Tennis Court 1', 957)
('Massage Room 1', 884)
('Tennis Court 2', 882)
('Snooker Table', 860)
('Pool Table', 856)
('Table Tennis', 794)
('Squash Court', 418)
('Massage Room 2', 54)


/* Q13: Find the facilities usage by month, but not guests */
CODE
def select_all_tasks(conn):
    cur = conn.cursor()
    
    query1 = """
        SELECT 
            f.name, 
            strftime('%m', b.starttime) AS month, 
            SUM(b.slots) AS total_usage
        FROM Bookings AS b
        INNER JOIN Facilities AS f ON b.facid = f.facid
        WHERE b.memid > 0
        GROUP BY f.name, month
        ORDER BY month, total_usage DESC;
        """
        
    cur.execute(query1)
    rows = cur.fetchall()
    for row in rows:

OUTPUT
2.6.0
2. Query all tasks
('Tennis Court 1', '07', 201)
('Massage Room 1', '07', 166)
('Badminton Court', '07', 165)
('Snooker Table', '07', 140)
('Tennis Court 2', '07', 123)
('Pool Table', '07', 110)
('Table Tennis', '07', 98)
('Squash Court', '07', 50)
('Massage Room 2', '07', 8)
('Badminton Court', '08', 414)
('Tennis Court 2', '08', 345)
('Tennis Court 1', '08', 339)
('Massage Room 1', '08', 316)
('Snooker Table', '08', 316)
('Pool Table', '08', 303)
('Table Tennis', '08', 296)
('Squash Court', '08', 184)
('Massage Room 2', '08', 18)
('Badminton Court', '09', 507)
('Pool Table', '09', 443)
('Tennis Court 1', '09', 417)
('Tennis Court 2', '09', 414)
('Snooker Table', '09', 404)
('Massage Room 1', '09', 402)
('Table Tennis', '09', 400)
('Squash Court', '09', 184)
('Massage Room 2', '09', 28)
        print(row)

