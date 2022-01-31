/* question 1 */
select title
from course
where dept_name ='Comp. Sci.' and credits = 3;

/* question 2 */
select distinct takes.ID
from takes, instructor, teaches
where takes.course_id = teaches.course_id and
	takes.sec_id = teaches.sec_id and 
    takes.semester = teaches.semester and 
    takes.year  = teaches.year and
	teaches.ID = instructor.ID and
    instructor.name = 'Romero'; 
    
/* Question 3 */
/* Find the ID and name of each student who has took at least one course after 2017. */

/* What data attributes we need in the result set?  student.ID, student.name

What data attributes are used in the condition? takes.ID, takes.year

In what tables do we have this information, what are the names of the attributes?
tables: student, takes
attributes: student.ID, student.name, takes.ID, takes.year

If there is more than one table, how we join the tables?
student.ID = takes.ID

What other condition should be satisfied? Because the prompt asks for after 2017, I use > instead of >= 
takes.year > 2017
*/

select distinct student.name, student.ID
from student, takes
where student.ID = takes.ID and
	takes.year > 2017;
    
/* Result: 1921 rows*/

/* Question 4 */
/* Find the ID and name of each student who has taken at least one Comp. Sci. course; 
make sure there are no duplicates in the result */

/* What data attributes we need in the result set?  student.ID, student.name

What data attributes are used in the condition? student.dept_name = 'Comp. Sci.'

In what tables do we have this information, what are the names of the attributes?
tables: student, takes
attributes: student.ID, student.name, takes.ID, takes.course_id, course.course_id, course.dept_name

If there is more than one table, how we join the tables?
student.ID = takes.ID
takes.course_id = course.course_id

What other condition should be satisfied?
course.dept_name = 'Comp. Sci'
*/

select distinct student.name, student.ID
from student, takes, course
where student.ID = takes.ID and
	takes.course_id = course.course_id and
    course.dept_name = 'Comp. Sci.';
    
/* Result: 993 rows */
