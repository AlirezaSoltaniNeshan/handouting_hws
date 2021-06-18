/* Students table 
create table students (
	std_id int unsigned not null primary key,
    std_fname varchar(20),
    std_lname varchar(30),
    std_father_name varchar(15),
    std_age int (2),
    std_gender boolean,
    accepted_time int(2),
    std_city varchar(20),
    std_address text,
    diploma_avg int(2)
);
-- alter table students add std_natural_code varchar(10) unique after std_id 
-- alter table students add std_email varchar(100)
-- alter table students add std_tel varchar(12) 
-- alter table students add std_birth_date date
-- alter table students add std_field_study enum('Computer', 'Accounting', 'electronic')
-- alter table students add std_sub_study enum('software', 'it', 'hardware', 'ict', 'robotic', 'pure accounting')
-- alter table students add graduate_date int(2) after accepted_time
*/

/* Students, professors and employees profile (nad) 
create table profile_sys(
	agents_id int unsigned not null primary key,
    std_username varchar(50) unique,
    std_password varchar(150),
    agent_type enum('students', 'professors', 'employees')
);*/

/* Professors
create table professors(
	prof_id int unsigned not null primary key,
    prof_natural_code varchar(10) not null unique,
    prof_fname varchar(20),
    prof_lname varchar(30),
    prof_degree enum('Diploma','Bachelor','Master','PhD'),
    prof_age int(2),
    prof_city varchar(30),
    prof_email varchar(100),
    prof_tel varchar(11),
    prof_background_years int(2) check (prof_background_years <= 40)
);*/

-- Extra point maybe our professors have two or more filed of study 
/*create table prof_degrees(
	serial int unsigned primary key auto_increment,
	prof_id int unsigned not null,
    prof_filed_sduty varchar(50),
    prof_degree enum('Diploma','Bachelor','Master','PhD') null,
    
    foreign key (prof_id) references professors(prof_id)
);*/

/* University employees

create table employees(
	emp_id int unsigned not null primary key,
    emp_natural_code varchar(10) not null unique,
    emp_fname varchar(20),
    emp_lname varchar(30),
    emp_degree enum('Diploma','Bachelor','Master','PhD'),
    emp_age int(2) unsigned,
    emp_email varchar(100),
    emp_tel varchar(12),
    emp_birth_date date,
    emp_city varchar(15),
    emp_gender boolean,
    emp_marriage boolean,
    emp_background_years int(2) check (emp_background_years <= 32)
);
-- TODO 
-- alter table employees add cooperaion_date date  
-- alter table employees add resignation_date date  
*/

/* Sections of university  
create table university_sections(
	section_id int unsigned not null primary key,
    section_name varchar(15) null    
);*/

/* Emploeeys of Sections 
create table sections_employees(
	serial int unsigned auto_increment primary key,
    emp_id int unsigned,
    section_id int unsigned,
    agent_type enum('employee', 'admin'),
    foreign key (emp_id) references employees(emp_id),
    foreign key (section_id) references university_sections(section_id)
)
-- alter table sections_employees add cooperaion_date_insection date  
-- alter table sections_employees add resignation_date_insection date  
*/

/* Courses 
create table courses(
	cour_id int unsigned primary key not null,
	cour_name varchar(30),
    cour_unit int(2),
    cour_duration int(3)
)
-- alter table courses add sub_study enum('software', 'it', 'hardware', 'ict', 'robotic', 'pure accounting')
*/

/* Provide courses, provide number, prof_id and courses id is used to create rel 
create table provide_courses(
	provide_id int unsigned primary key not null,
    prof_id int unsigned,
	cour_id int unsigned,
    term int(2) unsigned null,
    
    foreign key (prof_id) references professors(prof_id),
    foreign key (cour_id) references courses (cour_id)
);*/

/* Obtained units by students
create table std_optained_units(
	serial int unsigned not null primary key auto_increment,
    std_id int unsigned,
    cour_id int unsigned,
    term int(2) unsigned null,
    
    foreign key (std_id) references students(std_id),
    foreign key (cour_id) references courses(cour_id)
)*/

/* final evaluation of student by their score and 3 or more join!! (std_id, cour_id, prof_id, cour_score)
create table final_eval(
	serial int not null primary key auto_increment,
    std_id int unsigned,
    cour_id int unsigned,
    prof_id int unsigned,
    cour_score int unsigned 
    check (cour_score between 0 and 20),
    
	foreign key (std_id) references students(std_id),
    foreign key (cour_id) references courses(cour_id),
    foreign key (prof_id) references professors(prof_id)
)*/

